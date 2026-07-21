---
title: "Cấu hình App Client & Identity Pool"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.1.2. </b> "
---

### Cấu hình App Client & Identity Pool

**Mục tiêu:** Cấu hình App Client để kích hoạt phương thức xác thực `ALLOW_USER_PASSWORD_AUTH`, sau đó tạo Identity Pool để đổi JWT lấy IAM credentials tạm thời cho client.

#### Bước 1: Xem App Client ID

Trong **Applications**, bấm **App clients** để xem Client ID.

![Hình 12 - Xem App clients](/images/5-Workshop/5.1-Cognito/5.1.2/img12.png)

**Ghi chú:** Client ID: `73ipqvvo7h3u0j3elfqlj23jo3`

#### Bước 2: Chỉnh sửa App Client

Chọn **FightingGame** để hiển thị App client, sau đó chọn **Edit**.

![Hình 13 - Chỉnh sửa App client FightingGame](/images/5-Workshop/5.1-Cognito/5.1.2/img13.png)

#### Bước 3: Kích hoạt Authentication Flow

Tích chọn **Sign in with username and password: ALLOW_USER_PASSWORD_AUTH**.

![Hình 14 - Chọn ALLOW_USER_PASSWORD_AUTH](/images/5-Workshop/5.1-Cognito/5.1.2/img14.png)

Chọn **Save changes**.

![Hình 15 - Save changes](/images/5-Workshop/5.1-Cognito/5.1.2/img15.png)

![Hình 16 - Đã lưu thành công](/images/5-Workshop/5.1-Cognito/5.1.2/img16.png)

#### Bước 4: Tạo Identity Pool

Quay lại trang Cognito và chọn **Identity pools**.

![Hình 17 - Chọn Identity pools](/images/5-Workshop/5.1-Cognito/5.1.2/img17.png)

Chọn **Create identity pools**.

![Hình 18 - Create identity pools](/images/5-Workshop/5.1-Cognito/5.1.2/img18.png)

#### Bước 5: Cấu hình Identity Pool

Tích **Authenticated access**, tích **Amazon Cognito user pool** và chọn **Next**.

![Hình 19 - Cấu hình Authenticated access](/images/5-Workshop/5.1-Cognito/5.1.2/img19.png)

#### Bước 6: Tạo IAM Role

Tại **Configure permissions** → **Create a new IAM Role**, điền IAM role name: `FightingGameAuthenticatedRole` và chọn **Next**.

![Hình 20 - Tạo IAM Role FightingGameAuthenticatedRole](/images/5-Workshop/5.1-Cognito/5.1.2/img20.png)

#### Bước 7: Kết nối Identity Provider

Nhập **User pool ID** và **App Client ID**, sau đó chọn **Next**.

![Hình 21 - Nhập User pool ID và App Client ID](/images/5-Workshop/5.1-Cognito/5.1.2/img21.png)

#### Bước 8: Đặt tên và hoàn tất

Điền **Name**: `FightingGameIdentityPool` và chọn **Next**.

![Hình 22 - Đặt tên FightingGameIdentityPool](/images/5-Workshop/5.1-Cognito/5.1.2/img22.png)

Kiểm tra lại lựa chọn và chọn **Create identity pool**.

![Hình 23 - Review và Create identity pool](/images/5-Workshop/5.1-Cognito/5.1.2/img23.png)

#### Kết quả

Identity Pool đã được tạo thành công.

![Hình 24 - Identity Pool tạo thành công](/images/5-Workshop/5.1-Cognito/5.1.2/img24.png)

**Ghi chú:** Identity Pool ID: `ap-southeast-1:a5d743b9-e4a4-45d2-9cb1-9d214cee574c`

