---
title: "Tạo Cognito User Pool"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.1.1. </b> "
---

### Tạo Cognito User Pool

**Mục tiêu:** Khởi tạo User Pool để quản lý tài khoản người chơi, cho phép đăng ký và đăng nhập bằng Username + Password, đồng thời cấp JWT token để sử dụng ở các bước sau.

#### Bước 1: Đổi Region sang Singapore

Đảm bảo em đang ở region **ap-southeast-1 (Singapore)** trước khi bắt đầu.

![Hình 1 - Đổi region sang Singapore](/images/5-Workshop/5.1-Cognito/5.1.1/img1.png)

![Hình 2 - Đã ở region Singapore](/images/5-Workshop/5.1-Cognito/5.1.1/img2.png)

#### Bước 2: Tìm kiếm và mở Cognito

Trên ô Search, tìm **Cognito**.

![Hình 3 - Tìm kiếm Cognito](/images/5-Workshop/5.1-Cognito/5.1.1/img3.png)

![Hình 4 - Đã ở trang Amazon Cognito](/images/5-Workshop/5.1-Cognito/5.1.1/img4.png)

#### Bước 3: Bắt đầu tạo User Pool

Chọn **"Get started for free in less than five minutes"**.

![Hình 5 - Lựa chọn Get started](/images/5-Workshop/5.1-Cognito/5.1.1/img5.png)

![Hình 6 - Trang Set up resources for your application](/images/5-Workshop/5.1-Cognito/5.1.1/img6.png)

#### Bước 4: Chọn loại ứng dụng và đặt tên

Chọn **"Single-page application (SPA)"** và đặt tên cho application.

![Hình 7 - Chọn SPA và đặt tên application](/images/5-Workshop/5.1-Cognito/5.1.1/img7.png)

#### Bước 5: Cấu hình tùy chọn

- Tích **Username** và chọn **Enable Self-registration** để cho phép người dùng tự tạo tài khoản.
- Tại **Required attributes for sign-up**, chọn **email** (Cognito bắt buộc cần email hoặc số điện thoại; email phù hợp hơn cho demo và khôi phục mật khẩu).

![Hình 8 - Configure options](/images/5-Workshop/5.1-Cognito/5.1.1/img8.png)

#### Bước 6: Xóa https:// và tạo User Directory

Xóa `https://` (chưa cần dùng đến) và chọn **Create user directory**.

![Hình 9 - Tạo User Directory](/images/5-Workshop/5.1-Cognito/5.1.1/img9.png)

#### Kết quả

Đã tạo thành công 1 User Pool.

![Hình 10 - Tạo User Pool thành công](/images/5-Workshop/5.1-Cognito/5.1.1/img10.png)

Xem thông tin User Pool. Ghi lại **User Pool ID** để dùng ở các bước tiếp theo.

![Hình 11 - User Pool ID: ap-southeast-1_phYoaMUPC](/images/5-Workshop/5.1-Cognito/5.1.1/img11.png)

**Ghi chú:** User Pool ID: `ap-southeast-1_phYoaMUPC`

