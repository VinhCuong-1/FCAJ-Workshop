---
title: "Create ActiveMatches Table & Verify"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.2.2. </b> "
---

### Create ActiveMatches Table & Verify

**Objective:** Create the second table to store information about ongoing matches, then confirm both tables are in Active status.

#### Step 1: Fill in ActiveMatches Table Information

Create a new table with the following:

| Field | Value |
|-------|-------|
| Table name | `ActiveMatches` |
| Partition key | `playerId` |
| Data type | `String` |
| Sort key | *(leave empty)* |
| Settings | Default settings |

Scroll to the bottom of the page and click **Create table**.

![Figure 28 - Create ActiveMatches table](/images/5-Workshop/5.2-DynamoDB/5.2.2/img28.png)

#### Result

Both tables are now in **Active** status after creation.

![Figure 29 - Both tables are Active](/images/5-Workshop/5.2-DynamoDB/5.2.2/img29.png)

**Note:** Only when a table is in `Active` status can data be read/written. Make sure both tables are Active before continuing.

