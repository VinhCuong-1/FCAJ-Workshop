---
title: "Create MatchAnalytic Lambda & Test Logs"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.6.2. </b> "
---

### Create MatchAnalytic Lambda & Test Logs

**Objective:** Create a Lambda function that receives events from DynamoDB Streams, processes match results, and writes analytics logs.

#### Step 1: Create MatchAnalytic Lambda

Go to **Lambda** → **Create function** → name it `MatchAnalyticLambda` → select Runtime (Node.js or Python) → attach IAM Role `MatchAnalyticRole`.

![Figure 1 - Created Role for MatchAnalytic Lambda](/images/5-Workshop/5.6-Async/5.6.2/img37.png)

#### Step 2: Add DynamoDB Stream as Trigger

In **Function overview** → **Add trigger** → select **DynamoDB** → select the stream for the `ActiveMatches` table.

#### Step 3: Test and View Logs

After a match ends and results are written to DynamoDB, the Lambda will automatically trigger. Check CloudWatch Logs to confirm data is processed correctly.

![Figure 2 - Created Match Analytic Lambda](/images/5-Workshop/5.6-Async/5.6.2/img38.png)

#### Result

- DynamoDB stores match data per record
- Stream triggers Lambda automatically within seconds
- Analytics logs written to CloudWatch for later analysis

**Note:** This asynchronous flow is completely separate from Flow R (matchmaking), ensuring post-match processing does not affect the latency of the main system.

