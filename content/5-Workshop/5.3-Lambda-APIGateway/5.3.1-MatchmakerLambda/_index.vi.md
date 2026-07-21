---
title: "Xây dựng hàm Matchmaker Lambda"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.3.1. </b> "
---

### Xây dựng hàm Matchmaker Lambda

**Mục tiêu:** Tạo hàm Lambda `FightingGameMatchmaker` để xử lý logic tìm trận (matchmaking), cấp quyền truy cập DynamoDB, cấu hình biến môi trường và tiến hành kiểm thử (test).

#### Bước 1: Truy cập Lambda

Trên thanh tìm kiếm (Search bar), các em tìm kiếm **Lambda**.

![Hình 30 - Truy cập Lambda](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img30.png)

#### Bước 2: Tạo hàm mới

Chọn **Create a function**.

![Hình 31 - Tạo hàm](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img31.png)

#### Bước 3: Đặt tên cho hàm

Nhập Function name: `FightingGameMatchmaker`.

![Hình 32 - Nhập tên hàm](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img32.png)

#### Bước 4: Cấp quyền DynamoDB cho Lambda

Tại tab **Configure** → chọn **Permissions** → Bấm vào link **Role name** để thêm quyền.

![Hình 34 - Chọn Role name](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img34.png)

Chọn **Add permission** → Chọn **Create inline policy**.

![Hình 36 - Thêm quyền](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img36.png)

Nhập **Policy name** → Chọn **Create policy**.

![Hình 39 - Nhập Policy name và Tạo](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img39.png)

Policy đã được gắn thành công cho Lambda.

![Hình 40 - Policy đã gắn cho Lambda](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img40.png)

#### Bước 5: Cấu hình biến môi trường

Quay trở lại Lambda, các em chọn **Configurations** → **Environment variables** → **Edit**.

![Hình 41 - Cấu hình biến môi trường](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img41.png)

Thêm các **Keys** cần thiết (ví dụ: `MATCHMAKING_TABLE`, `ACTIVE_MATCHES_TABLE`).

![Hình 42 - Thêm các Key biến môi trường](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img42.png)

#### Bước 6: Cập nhật mã nguồn

Chọn **Code** → Dán mã nguồn của Matchmaker Lambda vào.

![Hình 44 - Dán mã nguồn vào Lambda](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img44.png)

#### Bước 7: Kiểm thử Lambda

**Test Người chơi 1 (Player 1):**

![Hình 46 - Test Player 1](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img46.png)

Người chơi 1 thành công.

![Hình 47 - Player 1 thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img47.png)

**Test Người chơi 2 (Player 2):**

![Hình 48 - Test Player 2](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img48.png)

Người chơi 2 thành công.

![Hình 50 - Player 2 thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img50.png)

#### Bước 8: Kiểm tra trong DynamoDB

Kiểm tra xem Người chơi 1 đã được thêm vào hàng đợi (queue) chưa.

![Hình 53 - Xác nhận Player 1 trong hàng đợi](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img53.png)

**Kết quả:** Matchmaker Lambda hoạt động chính xác, ghi dữ liệu thành công vào DynamoDB và trả về phản hồi đúng cho cả hai người chơi.
