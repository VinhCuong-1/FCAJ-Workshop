---
title: "Blog 3"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 3.3. </b> "
---
# Provisioning 250+ Tài khoản AWS & AI Dashboard trong 4 Giờ

Để giải quyết thách thức về việc cung cấp hạ tầng (provisioning) cho hơn 500 người tham gia Hackathon trong khi vẫn đảm bảo bảo mật dữ liệu nội bộ, đội ngũ kỹ sư đã loại bỏ hoàn toàn các quy trình thủ công. Thay vào đó, họ đã áp dụng các nguyên lý tự động hóa của Infrastructure as Code (IaC) và Serverless với ba lớp kiến trúc cốt lõi:

Dưới đây là sơ đồ kiến trúc của hệ thống cấp phát tài khoản tự động và bảng điều khiển (dashboard) tự phục vụ:

![Innovation Sandbox and Dashboard Architecture on AWS](/images/3-BlogsPosted/image_sandbox.png)

### 1. Lớp Quản trị & Cô lập (Governance & Isolation Layer)
Tận dụng nền tảng AWS Organizations và Innovation Sandbox. Tất cả các tài khoản mới đều được đưa vào một Organizational Unit (OU) chuyên biệt. Hệ thống sử dụng các SCPs (Service Control Policies) để khóa quyền—chỉ cho phép gọi các API của Amazon Bedrock và SageMaker, đồng thời chặn tất cả các dịch vụ không liên quan hoặc đắt tiền.

### 2. Lớp Cung cấp Tự động (Automated Provisioning Layer)
Triển khai AWS Control Tower Automate Account Creation. Hệ thống sử dụng CloudFormation để gọi trực tiếp các API của AWS Service Catalog nhằm tạo ra hàng loạt tài khoản song song. Thời gian provisioning được giảm từ "hàng giờ" xuống chỉ còn "vài giây" cho mỗi tài khoản.

### 3. Lớp AI Dashboard (Serverless)
Xây dựng một ứng dụng web để người dùng tự phục vụ việc truy vấn (Knowledge Base) và theo dõi tiến độ theo thời gian thực dành cho ban lãnh đạo.

* **Frontend:** Lưu trữ dưới dạng tĩnh trên S3 và phân phối với tốc độ cao qua CloudFront.
* **Backend:** API Gateway kết nối với Lambda để kích hoạt Amazon Q Business. Trợ lý AI này sẽ tự động tạo một Anonymous URL bảo mật để trả về biểu đồ phân tích và giao diện chat cho người dùng.

### Kết quả Thực thi (Tech Impact)
Đã triển khai thành công 246 Tài khoản AWS tiêu chuẩn doanh nghiệp trong chưa đầy 4 giờ. Nhờ thiết kế 100% Serverless và cơ chế tự động dọn dẹp Sandbox, hệ thống không phát sinh bất kỳ chi phí tính toán nào khi nhàn rỗi.

Việc kết hợp AWS Control Tower và hệ sinh thái Serverless là một pattern cực kỳ tối ưu cho Massive Account Provisioning. Mọi người có thể thoải mái chia sẻ quan điểm và trải nghiệm thực tế của mình dưới phần bình luận về việc cung cấp các tài khoản độc lập (để cô lập rủi ro) so với việc chia sẻ chung một tài khoản và xác định ranh giới bằng IAM Roles.

### Tài liệu tham khảo
* **Link bài gốc:** [Innovation Sandbox on AWS with real-time analytics dashboard](https://aws.amazon.com/vi/blogs/mt/innovation-sandbox-on-aws-with-real-time-analytics-dashboard/)