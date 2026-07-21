---
title: "Proposal"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# Hệ thống Backend cho Live-Service Game
## Tối ưu Chi phí và Hiệu suất với kiến trúc Serverless và EC2 Spot

### 1. Tóm tắt
Đây là một hệ thống backend cho live-service game chạy trên AWS, được thiết kế với cơ chế tối ưu hóa tài nguyên: tài nguyên tính toán (các máy chủ thực) chỉ được khởi tạo khi thực sự cần thiết, như lúc đăng nhập, tìm trận (matchmaking), và trong thời gian chơi game. Toàn bộ metagame (đăng nhập, tìm trận, lưu kết quả) được vận hành hoàn toàn trên kiến trúc Serverless, trong khi session game trực tiếp sử dụng fleet EC2 Spot và chỉ được khởi động khi có yêu cầu từ Matchmaker. Việc triển khai và cập nhật được tự động hóa hoàn toàn thông qua GitOps, đảm bảo tính ổn định và bảo mật cao.

### 2. Vấn đề
**Vấn đề là gì?**
Trong các live-service game truyền thống, việc duy trì các game server 24/7 (standing servers) gây lãng phí tài nguyên và tốn chi phí khổng lồ, đặc biệt trong thời gian nhàn rỗi khi không có ai chơi. Việc triển khai thủ công lên môi trường production thường tiềm ẩn rủi ro downtime và ảnh hưởng tiêu cực đến trải nghiệm của người chơi đang trong trận.

**Giải pháp**
Hệ thống giải quyết vấn đề này bằng quy tắc: "Serverless cho mọi thứ ngoại trừ các session game trực tiếp".
- Metagame (đăng nhập, tìm trận, ghi kết quả) chạy serverless.
- Các session game trực tiếp nằm sau một ranh giới mạng riêng biệt bên trong một VPC, hoàn toàn cô lập với các luồng xác thực và tìm trận. EC2 Spot instances chỉ được kích hoạt (khởi động) khi có yêu cầu.
- Sử dụng GitOps cho CI/CD để tự động cập nhật, đảm bảo chuyển hướng lưu lượng (traffic shifting) dần dần mà không làm treo các trận đấu đang diễn ra.

**Lợi ích và Tỷ suất hoàn vốn (ROI)**
- **Tối ưu Chi phí:** Không có NAT Gateway, không có Load Balancers thường trực. Fleet game sử dụng EC2 Spot Instances trên bộ xử lý Graviton ARM64 để tối đa hóa tiết kiệm. Máy chủ chỉ tồn tại khi có trận đấu.
- **Tối ưu Vận hành:** Các AMI cực kỳ mỏng vì artifacts được tập trung trên S3; việc cập nhật server bundle không yêu cầu phải đóng gói lại AMI cho mỗi bản patch nhỏ.
- **Bảo mật tuyệt đối:** Vòng đời của máy chủ, quyền truy cập mạng, và phạm vi thông tin xác thực hoàn toàn trùng khớp với thời gian một session chơi thực sự cần chúng—không hơn, không kém.

### 3. Kiến trúc Giải pháp
Kiến trúc được chia thành bốn luồng riêng biệt, mỗi luồng có trigger và ranh giới tin cậy (trust boundary) riêng:

**Luồng C (CI/CD - GitOps):** Chạy trong quá trình triển khai, không chạm tới các trận đấu đang diễn ra. Một pipeline GitOps (GitHub Actions) build artifacts -> CodeDeploy chuyển traffic sang một Lambda alias mới và cập nhật template cho EC2. Client builds, patches, và server bundles được upload lên S3.

**Luồng A (Xác thực & Phân phối Asset):** Người chơi đăng nhập qua Cognito User Pool -> nhận JWT. Cognito Identity Pool đổi JWT lấy thông tin xác thực IAM tạm thời (được giới hạn bằng prefix) để tải assets trực tiếp từ S3.

**Luồng R (Yêu cầu Chính - Đồng bộ):** Client gửi yêu cầu tìm trận qua CloudFront (WAF) -> API Gateway xác thực JWT -> Matchmaker Lambda (trong private subnet) ghi trạng thái trận đấu vào DynamoDB và gọi control plane EC2 qua VPC Interface Endpoint để yêu cầu một instance đang chờ sẵn từ Spot ASG. Lambda thêm các rules SG cho mỗi người chơi và trả về IP/Port. Client kết nối trực tiếp đến game instance qua Internet Gateway.

**Luồng E (Sau trận đấu - Bất đồng bộ):** Kết quả được ghi vào DynamoDB -> DynamoDB Streams kích hoạt một Lambda chạy ngầm để xử lý logs và đẩy sang analytics. Hoàn toàn cô lập để không ảnh hưởng đến độ trễ của Luồng R.

![Game Live-Service Architecture](/images/2-Proposal/architecture.png)

**Các dịch vụ AWS sử dụng**
- **Amazon EC2 (Spot Instances - Graviton):** Chạy các session game trực tiếp.
- **AWS Lambda & API Gateway:** Xử lý logic tìm trận và sự kiện sau trận đấu.
- **Amazon S3:** Lưu trữ artifact tập trung cho client và server.
- **Amazon Cognito:** Xác thực người dùng và cung cấp thông tin xác thực IAM tạm thời.
- **Amazon DynamoDB:** Lưu trạng thái và kết quả trận đấu.
- **Amazon CloudFront & WAF:** Phân phối các yêu cầu và bảo vệ các endpoints.
- **AWS CodeDeploy:** Quản lý chuyển traffic và cập nhật phiên bản.

**Thiết kế Thành phần**
- Matchmaker Lambda hoạt động trong Private Subnet, giao tiếp với các API của DynamoDB và EC2 qua VPC Endpoints (không phơi bày ra internet công cộng).
- Khi EC2 (Spot) khởi động, User Data sử dụng IAM Instance Profile (luồng G4) để kéo server binary mới nhất từ S3 và chuẩn bị sẵn sàng nhận người chơi (luồng G3).

### 4. Triển khai Kỹ thuật
**Các giai đoạn Triển khai**
1. **Thiết kế Hạ tầng & Phân quyền:** Xây dựng VPC, Private/Public Subnets, VPC Endpoints, cấu hình Cognito và các IAM roles (Instance Profiles, Scoped Temp Credentials).
2. **Pipeline CI/CD (GitOps):** Cấu hình GitHub Actions, AWS CodeDeploy, và S3 buckets để tự động build/deploy.
3. **Phát triển Luồng Serverless:** Viết Lambda cho việc tìm trận, tích hợp API Gateway, CloudFront, và WAF. Cấu hình DynamoDB và DynamoDB Streams để xử lý sau trận đấu.
4. **Cấu hình Game Fleet:** Thiết lập Auto Scaling Group (ASG) cho EC2 Spot (Graviton), cấu hình scripts User Data để kéo các server bundles từ S3 khi khởi động.
5. **Kiểm thử & Tối ưu hóa:** Load testing, kiểm thử traffic shifting, rollbacks, và giám sát qua CloudWatch.

### 5. Lộ trình & Cột mốc
- **Tháng 1:** Hoàn thiện kiến trúc mạng (VPC, Endpoints) và hệ thống xác thực (Cognito).
- **Tháng 2:** Thiết lập luồng CI/CD (GitOps) và cơ chế phân phối Asset qua S3.
- **Tháng 3:** Phát triển logic Serverless (Matchmaking Lambda, DynamoDB) và cấu hình EC2 Spot Fleet.
- **Tháng 4:** Tích hợp toàn bộ hệ thống, kiểm thử bảo mật (WAF, IAM Roles), load testing, và go-live.

### 6. Ước tính Ngân sách
Vì hệ thống tuân theo mô hình "compute-on-demand", chi phí cơ bản cực kỳ thấp:
- **EC2 Spot (Graviton):** Tiết kiệm lên tới 70-90% so với On-demand, chỉ phát sinh khi có các trận đấu đang hoạt động.
- **Lambda, API Gateway, DynamoDB:** Pay-as-you-go (dùng bao nhiêu trả bấy nhiêu), không có trận đấu nghĩa là không có chi phí máy chủ.
- **S3 & CloudFront:** Chi phí lưu trữ và truyền tải dữ liệu rẻ.
- **Không có chi phí cho:** Hệ thống hoàn toàn loại bỏ NAT Gateways và Load Balancers thường trực (vì clients kết nối trực tiếp qua các dynamic SG rules).

### 7. Đánh giá Rủi ro
**Ma trận Rủi ro**
- **Bị gián đoạn EC2 Spot:** Tác động cao, xác suất trung bình.
- **Lỗi triển khai phiên bản mới:** Tác động trung bình, xác suất thấp (nhờ GitOps và chuyển traffic dần dần).

**Chiến lược Giảm nhẹ**
- **Gián đoạn Spot:** Thiết kế logic game để reconnect nhanh hoặc chuyển đổi sang các instances khác.
- **Triển khai:** Sử dụng Blue/Green deployment hoặc Linear traffic shifting qua CodeDeploy.

**Kế hoạch Dự phòng**
- Rollback tức thời các phiên bản Lambda và AMIs nếu phát hiện lỗi production qua GitOps, mà không làm treo các trận đấu đang chạy.

### 8. Kết quả Mong đợi
- **Cải tiến Kỹ thuật:** Loại bỏ hoàn toàn chi phí bảo trì standing server. Hệ thống bảo mật cao với sự phân tách rõ ràng giữa auth, serverless logic, và game nodes.
- **Giá trị Dài hạn:** Một kiến trúc có khả năng mở rộng vô hạn phục vụ như một nền tảng tiêu chuẩn để vận hành các live-service games chi phí thấp trong khi vẫn đảm bảo độ trễ thấp và tính sẵn sàng cao.