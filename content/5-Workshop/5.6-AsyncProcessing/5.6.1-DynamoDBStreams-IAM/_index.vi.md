---
title: "Kích hoạt DynamoDB Streams & IAM Roles"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.6.1. </b> "
---

### Kích hoạt DynamoDB Streams & IAM Roles

**Mục tiêu:** Bật DynamoDB Streams trên bảng `ActiveMatches` và tạo IAM Role cho Lambda Analytics để đọc stream data.

#### Bước 1: Kích hoạt DynamoDB Stream

Vào **DynamoDB** → chọn bảng `ActiveMatches` → tab **Exports and streams** → **Enable DynamoDB Streams** → chọn **New and old images**.

![Hình 1 - DynamoDB setup](/images/5-Workshop/5.6-Async/5.6.1/img34.png)

Trạng thái ứng dụng sau khi ghi vào DynamoDB.

![Hình 2 - Finished State application to DynamoDB](/images/5-Workshop/5.6-Async/5.6.1/img35.png)

#### Bước 2: Tạo IAM Role cho MatchAnalytic Lambda

Tạo IAM Role mới với tên `MatchAnalyticRole` cho phép Lambda đọc DynamoDB Streams và ghi CloudWatch Logs.

![Hình 3 - Created new Match analytic role](/images/5-Workshop/5.6-Async/5.6.1/img36.png)

#### Bước 3: Tạo Policy đọc Active Stream

Tạo inline policy cho phép `dynamodb:GetRecords`, `dynamodb:GetShardIterator`, `dynamodb:DescribeStream`, `dynamodb:ListStreams`.

**Lưu ý:** Chỉ cấp quyền tối thiểu — chỉ được phép đọc stream, không có quyền ghi vào bảng DynamoDB.

