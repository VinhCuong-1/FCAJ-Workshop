---
title: "Create MatchmakingQueue Table"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.2.1. </b> "
---

### Create MatchmakingQueue Table

**Objective:** Create a DynamoDB table to store the list of players waiting for matchmaking.

#### Step 1: Find DynamoDB

In the Search bar, search for **DynamoDB**.

![Figure 25 - Find DynamoDB](/images/5-Workshop/5.2-DynamoDB/5.2.1/img25.png)

#### Step 2: Start Creating a Table

Select **Get started**.

![Figure 26 - Get started](/images/5-Workshop/5.2-DynamoDB/5.2.1/img26.png)

#### Step 3: Fill in MatchmakingQueue Table Information

Fill in the following:

| Field | Value |
|-------|-------|
| Table name | `MatchmakingQueue` |
| Partition key | `playerId` |
| Data type | `String` |
| Sort key | *(leave empty)* |
| Settings | Default settings |

Scroll to the bottom of the page and click **Create table**.

![Figure 27 - Create MatchmakingQueue table](/images/5-Workshop/5.2-DynamoDB/5.2.1/img27.png)

