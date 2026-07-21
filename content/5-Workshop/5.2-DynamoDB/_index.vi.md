---
title: "Cơ sở dữ liệu DynamoDB: MatchmakingQueue & ActiveMatches"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.2. </b> "
---

### Cơ sở dữ liệu DynamoDB: MatchmakingQueue & ActiveMatches

Amazon DynamoDB là database NoSQL được dùng để lưu trữ **trạng thái hàng đợi ghép trận** và **các trận đang diễn ra** theo thời gian thực. Hai bảng cần tạo:

| Bảng | Mục đích |
|------|----------|
| `MatchmakingQueue` | Lưu danh sách người chơi đang chờ tìm trận |
| `ActiveMatches` | Lưu thông tin các trận đang diễn ra |

#### Các bước thực hiện

1. [Tạo Bảng MatchmakingQueue](5.2.1-MatchmakingQueue/)
2. [Tạo Bảng ActiveMatches & Kiểm tra](5.2.2-ActiveMatches/)
