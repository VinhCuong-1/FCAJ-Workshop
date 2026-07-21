---
title: "Create AMI & Launch Template"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.4.2. </b> "
---

### Create AMI & Launch Template

**Objective:** Tag the EC2 instance, bake an AMI from the configured game server instance, create a Launch Template with Spot configuration for ASG, and configure an IAM role for MatchMaker.

---

#### Step 1: Tag EC2 Instance

Before creating the AMI, add tags to the EC2 instance for better management:

![Figure 1 - Tag EC2 Instance](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img1.png)

| Key | Value |
|-----|-------|
| Name | `FightingGameServer` |
| Environment | `Production` |
| Role | `GameServer` |

---

#### Step 2: Bake AMI from Instance

Select the `FightingGameServer` EC2 instance → **Actions** → **Image and templates** → **Create image**.

Fill in the AMI information:

| Field | Value |
|-------|-------|
| Image name | `FightingGameServer-AMI-v1` |
| Image description | Game server with Node.js and PM2 pre-installed |
| No reboot | ✅ Enabled (to avoid restarting the instance) |

Select **Create image** → Wait for the AMI status to change to `available`.

![Figure 2 - AMI completed](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img2.png)

**Note:** The AMI creation process may take 5-10 minutes. Check the status at **EC2 → AMIs**.

---

#### Step 3: Create Launch Template (Spot)

Go to **EC2** → **Launch Templates** → **Create launch template**.

Configure the Launch Template:

| Field | Value |
|-------|-------|
| Launch template name | `FightingGameServer-LT` |
| Template version description | Spot-optimized template |
| AMI | `FightingGameServer-AMI-v1` (just created) |
| Instance type | `t3.small` |
| Key pair | Existing key pair |
| Security group | FightingGameServer security group |

**Spot Configuration:**

In **Advanced details** → **Purchasing option**: Select **Request Spot instances**.

---

#### Step 4: Configure IAM for MatchMaker

Create an IAM Instance Profile so EC2 can access DynamoDB and other AWS services:

![Figure 3 - Configure IAM Role for MatchMaker](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img3.png)

Attach the IAM Instance Profile to the Launch Template:

| Field | Value |
|-------|-------|
| IAM instance profile | `FightingGameServerInstanceRole` |

![Figure 4 - Launch Template completed](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img4.png)

Select **Create launch template** to finish.

**Result:** AMI `FightingGameServer-AMI-v1` and Launch Template `FightingGameServer-LT` have been successfully created. Ready to configure ASG in the next step.

