---
title: "Enable DynamoDB Streams & IAM Roles"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.6.1. </b> "
---

### Enable DynamoDB Streams & IAM Roles

**Objective:** Enable DynamoDB Streams on the `ActiveMatches` table and create an IAM Role for the Analytics Lambda to read stream data.

#### Step 1: Enable DynamoDB Stream

Go to **DynamoDB** → select the `ActiveMatches` table → **Exports and streams** tab → **Enable DynamoDB Streams** → select **New and old images**.

![Figure 1 - DynamoDB setup](/images/5-Workshop/5.6-Async/5.6.1/img34.png)

Application state after writing to DynamoDB.

![Figure 2 - Finished State application to DynamoDB](/images/5-Workshop/5.6-Async/5.6.1/img35.png)

#### Step 2: Create IAM Role for MatchAnalytic Lambda

Create a new IAM Role named `MatchAnalyticRole` allowing Lambda to read DynamoDB Streams and write to CloudWatch Logs.

![Figure 3 - Created new Match analytic role](/images/5-Workshop/5.6-Async/5.6.1/img36.png)

#### Step 3: Create Active Stream Reading Policy

Create an inline policy allowing `dynamodb:GetRecords`, `dynamodb:GetShardIterator`, `dynamodb:DescribeStream`, `dynamodb:ListStreams`.

**Note:** Grant minimum permissions only — read-only access to the stream, no write access to the DynamoDB table.

