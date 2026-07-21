---
title: "Xác thực người dùng với Amazon Cognito"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.1. </b> "
---

### Xác thực người dùng với Amazon Cognito

Amazon Cognito là dịch vụ quản lý danh tính người dùng của AWS. Trong hệ thống game này, Cognito đảm nhận hai nhiệm vụ chính:
- **User Pool**: Quản lý tài khoản người chơi, đăng ký, đăng nhập và cấp JWT token.
- **Identity Pool**: Đổi JWT lấy IAM credentials tạm thời để client tải asset trực tiếp từ S3.

#### Các bước thực hiện

1. [Tạo Cognito User Pool](5.1.1-UserPool/)
2. [Cấu hình App Client & Identity Pool](5.1.2-AppClient-IdentityPool/)
3. [Kiểm thử Giao diện Đăng ký Người dùng](5.1.3-TestUI/)
