---
title: "Tạo Bảng MatchmakingQueue"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.2.1. </b> "
---

### Tạo Bảng MatchmakingQueue

**Mục tiêu:** Tạo bảng DynamoDB để lưu danh sách người chơi đang chờ ghép trận.

#### Bước 1: Tìm DynamoDB

Trên thanh Search, tìm **DynamoDB**.

![Hình 25 - Tìm DynamoDB](/images/5-Workshop/5.2-DynamoDB/5.2.1/img25.png)

#### Bước 2: Bắt đầu tạo bảng

Chọn **Get started**.

![Hình 26 - Get started](/images/5-Workshop/5.2-DynamoDB/5.2.1/img26.png)

#### Bước 3: Điền thông tin bảng MatchmakingQueue

Điền các thông tin sau:

| Trường | Giá trị |
|--------|---------|
| Table name | `MatchmakingQueue` |
| Partition key | `playerId` |
| Kiểu dữ liệu | `String` |
| Sort key | *(để trống)* |
| Settings | Default settings |

Kéo xuống cuối trang và bấm **Create table**.

![Hình 27 - Tạo bảng MatchmakingQueue](/images/5-Workshop/5.2-DynamoDB/5.2.1/img27.png)

