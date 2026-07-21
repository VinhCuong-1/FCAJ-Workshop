---
title: "Blog 2"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 3.2. </b> "
---
# Kiến trúc Hybrid Cloud trong Phân tích Địa chất: Phân tích Giải pháp LITHOLENS™ trên AWS

Trong ngành công nghiệp khai khoáng, việc phân tích dữ liệu địa chất chính xác là điều kiện tiên quyết để tối ưu hóa thiết kế và phát triển mỏ. Theo truyền thống, quy trình ghi nhận lõi khoan đòi hỏi nhiều nhân lực, thời gian, và thường được tiến hành ở những khu vực hẻo lánh. Để giải quyết những hạn chế này, ALS GeoAnalytics đã phát triển LITHOLENS™—một nền tảng ứng dụng Machine Learning (ML) và Computer Vision để tự động hóa việc phân tích lõi khoan.

Tuy nhiên, việc vận hành các mô hình Deep Learning quy mô lớn đặt ra một thách thức kỹ thuật đáng kể: khối lượng công việc thường rất biến động. Việc duy trì các cụm máy chủ GPU 24/7 để chờ xử lý dữ liệu dẫn đến lãng phí tài nguyên và chi phí vận hành khổng lồ. Để giải quyết vấn đề này, ALS GeoAnalytics đã áp dụng kiến trúc hybrid cloud trên AWS, tách biệt rõ ràng lớp giao tiếp API với lớp xử lý tính toán.

Dưới đây là sơ đồ kiến trúc của hệ thống LITHOLENS™:

![LITHOLENS™ Architecture on AWS](/images/3-BlogsPosted/image_litholens.png)

### 1. Lớp API: Tối ưu hóa với Kiến trúc Serverless
Tất cả các requests gửi đến từ hệ thống client (gửi tác vụ, kiểm tra trạng thái, trích xuất kết quả) đều được xử lý qua một cổng giao tiếp thống nhất.

* **Amazon API Gateway và AWS Lambda:** Thay vì sử dụng các API servers truyền thống luôn hoạt động, hệ thống sử dụng Amazon API Gateway kết hợp với AWS Lambda. Mô hình serverless này cho phép hệ thống chỉ tính phí khi có các requests thực sự xảy ra. Trong thời gian lưu lượng truy cập tăng đột biến, AWS Lambda tự động mở rộng khả năng xử lý (scale up); ngược lại, khi không có tác vụ nào, chi phí vận hành của lớp này được giảm thiểu tối đa. Lambda cũng đóng vai trò là một orchestrator, nhận các tham số và cấu hình các tài nguyên tính toán tương ứng.

### 2. Lớp Tính toán và Xử lý: Xử lý AI Chuyên sâu
Lớp này là phần cốt lõi để chạy các tác vụ Deep Learning đòi hỏi nhiều tài nguyên, sử dụng các mô hình nội bộ như RoQE Net hoặc VeinNet.

* **Amazon EKS (Elastic Kubernetes Service):** Lớp tính toán chạy trên Amazon EKS sử dụng các G6 instances mạnh mẽ được trang bị GPU. Khía cạnh thiết kế quan trọng là khả năng auto-scale dựa trên độ dài của hàng đợi tác vụ (job queue).
* **Scale-to-Zero:** Khi không có tác vụ nào chờ trong hàng đợi, cụm EKS được cấu hình để scale down xuống mức không. Điều này đảm bảo rằng các tài nguyên máy chủ đắt đỏ chỉ được sử dụng và tính phí trong quá trình thực thi các tác vụ thực sự.
* **Custom AMI (Amazon Machine Image):** Để khắc phục độ trễ khởi động khi chạy các containers với các thư viện ML phức tạp, hệ thống sử dụng các AMIs được cấu hình sẵn. Các model artifacts và dependencies được đóng gói trực tiếp vào AMI, giảm thời gian khởi động container xuống dưới 30 giây, từ đó tăng băng thông (throughput) và giảm thiểu thời gian nhàn সার্ব rỗi.

### 3. Lớp Lưu trữ: Đảm bảo Tính toàn vẹn và Độc lập của Dữ liệu
Việc tách rời lớp lưu trữ khỏi lớp tính toán cho phép các Amazon EKS pods giữ được trạng thái stateless, đảm bảo an toàn dữ liệu khi hệ thống scale up hoặc scale down.

* **Amazon S3:** Được sử dụng làm object storage chính cho các file đầu vào (hình ảnh lõi khoan) và kết quả tính toán trung gian.
* **Amazon RDS (Relational Database Service):** Quản lý và lưu trữ dữ liệu có cấu trúc, bao gồm chi tiết tác vụ và siêu dữ liệu (metadata) địa chất.
* **Amazon CloudWatch:** Được tích hợp để giám sát hệ thống, ghi logs quá trình làm việc, và cung cấp các chỉ số hiệu năng theo thời gian thực.

### Kết luận
Kiến trúc của LITHOLENS™ là một minh chứng tuyệt vời cho nguyên tắc thiết kế tách rời (decoupling) trong kiến trúc phần mềm hiện đại. Bằng cách kết hợp sự linh hoạt và hiệu quả về chi phí của kiến trúc serverless (AWS Lambda) với sức mạnh tính toán có khả năng mở rộng cao của containers (Amazon EKS), các doanh nghiệp có thể vận hành các hệ thống AI nặng về máy chủ một cách bền vững. Cách tiếp cận này không chỉ đáp ứng các yêu cầu khắt khe về hiệu năng của xử lý Computer Vision mà còn giải quyết được bài toán tối ưu hóa chi phí cloud trên quy mô lớn.

### Tài liệu tham khảo
* **Link bài gốc:** [How ALS GeoAnalytics' LITHOLENS revolutionizes core logging through machine learning with Amazon EKS](https://aws.amazon.com/vi/blogs/architecture/how-als-geoanalytics-litholens-revolutionizes-core-logging-through-machine-learning-with-amazon-eks/)