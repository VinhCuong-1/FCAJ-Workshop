---
title: "Tạo Bảng ActiveMatches & Kiểm tra"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.2.2. </b> "
---

### Tạo Bảng ActiveMatches & Kiểm tra

**Mục tiêu:** Tạo bảng thứ hai để lưu trữ thông tin các trận đấu đang diễn ra, sau đó xác nhận cả 2 bảng đã ở trạng thái Active.

#### Bước 1: Điền thông tin bảng ActiveMatches

Tạo bảng mới với thông tin sau:

| Trường | Giá trị |
|--------|---------|
| Table name | `ActiveMatches` |
| Partition key | `playerId` |
| Kiểu dữ liệu | `String` |
| Sort key | *(để trống)* |
| Settings | Default settings |

Kéo xuống cuối trang và bấm **Create table**.

![Hình 28 - Tạo bảng ActiveMatches](/images/5-Workshop/5.2-DynamoDB/5.2.2/img28.png)

#### Kết quả

Cả 2 bảng sau khi tạo đã ở trạng thái **Active**.

![Hình 29 - Cả 2 bảng đã Active](/images/5-Workshop/5.2-DynamoDB/5.2.2/img29.png)

**Lưu ý:** Chỉ khi bảng ở trạng thái `Active` mới có thể đọc/ghi dữ liệu. Hãy đảm bảo cả hai bảng đều Active trước khi tiếp tục.

