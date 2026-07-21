---
title: "Xử lý dữ liệu bất đồng bộ sau trận đấu với DynamoDB Streams"
date: 2026-05-04
weight: 6
chapter: false
pre: " <b> 5.6. </b> "
---

### Xử lý dữ liệu bất đồng bộ sau trận đấu với DynamoDB Streams

Sau khi trận đấu kết thúc, kết quả được ghi vào DynamoDB. **DynamoDB Streams** sẽ tự động kích hoạt một Lambda nền để xử lý log, thống kê và đẩy sang analytics store — hoàn toàn **bất đồng bộ**, không làm chậm luồng matchmaking.

```
ActiveMatches (DynamoDB)
        ↓ Stream
MatchAnalytic Lambda
        ↓
Analytics / CloudWatch Logs
```

#### Các bước thực hiện

1. [Kích hoạt DynamoDB Streams & IAM Roles](5.6.1-DynamoDBStreams-IAM/)
2. [Khởi tạo MatchAnalytic Lambda & Kiểm thử Log](5.6.2-MatchAnalytic-Lambda/)
