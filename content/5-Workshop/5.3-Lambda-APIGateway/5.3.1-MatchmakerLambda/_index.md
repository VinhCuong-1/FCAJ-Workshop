---
title: "Build Matchmaker Lambda Function"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.3.1. </b> "
---

### Build Matchmaker Lambda Function

**Objective:** Create the `FightingGameMatchmaker` Lambda function to handle matchmaking logic, grant DynamoDB access permissions, configure environment variables, and test.

#### Step 1: Access Lambda

In the Search bar, search for **Lambda**.

![Figure 30 - Access Lambda](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img30.png)

#### Step 2: Create a New Function

Select **Create a function**.

![Figure 31 - Create a function](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img31.png)

#### Step 3: Name the Function

Enter the Function name: `FightingGameMatchmaker`.

![Figure 32 - Enter Function name](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img32.png)

#### Step 4: Grant DynamoDB Permissions to Lambda

On the **Configure** tab → select **Permissions** → Click the **Role name** link to add permissions.

![Figure 34 - Select Role name](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img34.png)

Select **Add permission** → Select **Create inline policy**.

![Figure 36 - Add permission](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img36.png)

Enter **Policy name** → Select **Create policy**.

![Figure 39 - Enter Policy name and Create](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img39.png)

Policy has been attached to Lambda.

![Figure 40 - Policy attached to Lambda](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img40.png)

#### Step 5: Configure Environment Variables

Go back to Lambda, select **Configurations** → **Environment variables** → **Edit**.

![Figure 41 - Configure Environment variables](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img41.png)

Add the required **Keys** (e.g., `MATCHMAKING_TABLE`, `ACTIVE_MATCHES_TABLE`).

![Figure 42 - Add Key environment variables](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img42.png)

#### Step 6: Update Source Code

Select **Code** → Paste the Matchmaker Lambda source code.

![Figure 44 - Paste source code into Lambda](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img44.png)

#### Step 7: Test Lambda

**Test Player 1:**

![Figure 46 - Test Player 1](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img46.png)

Player 1 successful.

![Figure 47 - Player 1 Success](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img47.png)

**Test Player 2:**

![Figure 48 - Test Player 2](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img48.png)

Player 2 successful.

![Figure 50 - Player 2 Success](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img50.png)

#### Step 8: Verify in DynamoDB

Check if Player 1 has been added to the queue.

![Figure 53 - Player 1 in queue verified](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.1/img53.png)

**Result:** The Matchmaker Lambda works correctly, successfully writing data to DynamoDB and returning correct responses for both players.

