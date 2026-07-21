---
title: "Asynchronous Post-Match Processing with DynamoDB Streams"
date: 2026-05-04
weight: 6
chapter: false
pre: " <b> 5.6. </b> "
---

### Asynchronous Post-Match Processing with DynamoDB Streams

After a match ends, the result is written to DynamoDB. **DynamoDB Streams** will automatically trigger a background Lambda to process logs, statistics, and push to an analytics store — completely **asynchronous**, without slowing down the matchmaking flow.

```
ActiveMatches (DynamoDB)
        ↓ Stream
MatchAnalytic Lambda
        ↓
Analytics / CloudWatch Logs
```

#### Steps

1. [Enable DynamoDB Streams & IAM Roles](5.6.1-DynamoDBStreams-IAM/)
2. [Create MatchAnalytic Lambda & Test Logs](5.6.2-MatchAnalytic-Lambda/)
