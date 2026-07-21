---
title: "Tạo hàm MatchAnalytic Lambda & Kiểm tra Log"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.6.2. </b> "
---

### Tạo hàm MatchAnalytic Lambda & Kiểm tra Log

**Mục tiêu:** Tạo một hàm Lambda để nhận các sự kiện (events) từ DynamoDB Streams, xử lý kết quả trận đấu, và ghi lại các log phân tích (analytics logs).

#### Bước 1: Tạo hàm MatchAnalytic Lambda

Các em vào **Lambda** → **Create function** → đặt tên là `MatchAnalyticLambda` → chọn Runtime (Node.js hoặc Python) → gắn (attach) IAM Role `MatchAnalyticRole`.

![Hình 1 - Đã tạo Role cho MatchAnalytic Lambda](/images/5-Workshop/5.6-Async/5.6.2/img37.png)

#### Bước 2: Thêm DynamoDB Stream làm Trigger

Tại **Function overview** → **Add trigger** → chọn **DynamoDB** → chọn stream của bảng `ActiveMatches`.

#### Bước 3: Kiểm thử và Xem Log

Sau khi một trận đấu kết thúc và kết quả được ghi vào DynamoDB, Lambda sẽ tự động được kích hoạt. Các em kiểm tra CloudWatch Logs để xác nhận dữ liệu được xử lý chính xác.

![Hình 2 - Đã tạo Match Analytic Lambda](/images/5-Workshop/5.6-Async/5.6.2/img38.png)

#### Kết quả

- DynamoDB lưu trữ dữ liệu trận đấu trên mỗi bản ghi
- Stream tự động kích hoạt Lambda chỉ trong vài giây
- Các log phân tích được ghi vào CloudWatch để phục vụ cho việc phân tích sau này

**Lưu ý:** Luồng xử lý bất đồng bộ này hoàn toàn tách biệt với Flow R (matchmaking), đảm bảo việc xử lý sau trận đấu không làm ảnh hưởng đến độ trễ (latency) của hệ thống chính.
