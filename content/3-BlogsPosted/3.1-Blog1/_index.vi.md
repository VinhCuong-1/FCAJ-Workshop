---
title: "Blog 1"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---
# Tự động hóa việc triển khai Oracle Database@AWS với Terraform

Chào các bạn đam mê công nghệ! Gần đây, việc tích hợp giữa các nền tảng đám mây lớn đang thu hút được rất nhiều sự chú ý từ cộng đồng kỹ sư. Một trong những cột mốc đáng chú ý nhất là giải pháp Oracle Database@AWS (ODB@AWS). Trong bài viết này, em sẽ chia sẻ một cái nhìn tổng quan về kiến trúc của hệ thống này và cách chúng ta có thể áp dụng Infrastructure as Code (IaC) với Terraform để tự động hóa quá trình triển khai.

### 1. Oracle Database@AWS (ODB@AWS) là gì?
Về bản chất, ODB@AWS cung cấp hạ tầng Oracle Exadata được quản lý trực tiếp bởi Oracle Cloud Infrastructure (OCI), nhưng hệ thống phần cứng này được đặt (colocated) ngay bên trong các data centers của AWS. Sự kết hợp này cho phép người dùng di chuyển các cơ sở dữ liệu Oracle lên AWS trong khi vẫn tận dụng được hiệu năng cao và khả năng mở rộng của Exadata.

Điểm sáng nhất của mô hình này là sự tích hợp sâu với các dịch vụ native của AWS. Các cơ sở dữ liệu Oracle giờ đây có thể chạy song song với các ứng dụng được triển khai trên Amazon EC2, Amazon ECS, hoặc Amazon EKS. Nhờ khoảng cách vật lý được rút ngắn, các luồng dữ liệu được đơn giản hóa, tính bảo mật được tăng cường, và việc phát triển ứng dụng trở nên nhanh chóng hơn. Hiện tại, ODB@AWS hỗ trợ hai dịch vụ cơ sở dữ liệu chính: Oracle Autonomous AI Database trên hạ tầng Exadata chuyên dụng (ADB-D) và Oracle Exadata Database Service trên hạ tầng chuyên dụng (ExaDB-D).

### 2. Kiến trúc Cốt lõi của Giải pháp
Để dễ hình dung hơn về cách hai gã khổng lồ đám mây này kết nối với nhau, các bạn có thể tham khảo sơ đồ kiến trúc bên dưới:

![Oracle Database@AWS Architecture](/images/3-BlogsPosted/image_39402e.png)

Dưới đây là phần phân tích các thành phần cốt lõi tạo nên kiến trúc này:

* **Amazon VPC và Subnet:** Amazon VPC cho phép bạn khởi chạy các tài nguyên AWS vào một mạng ảo do bạn định nghĩa. Sau khi tạo VPC, bạn có thể thiết lập các subnets (dải địa chỉ IP) để chứa các tài nguyên như máy chủ EC2 trong các vùng mạng cụ thể.
* **OCI Virtual Cloud Network (VCN) và Subnet:** VCN là một mạng nội bộ riêng tùy chỉnh được thiết lập bên trong một OCI tenancy ở một Oracle Region. Điểm đặc biệt của mô hình multicloud này là khi bạn tạo một mạng ODB cùng các subnets của nó trên AWS, một VCN tương ứng cùng các subnets sẽ tự động được tạo ở phía OCI Region.

### 3. Tài liệu tham khảo
* **Link bài gốc:** [Provision Oracle Database@AWS resources using Terraform](https://aws.amazon.com/vi/blogs/database/provision-oracle-databaseaws-resources-using-terraform/)