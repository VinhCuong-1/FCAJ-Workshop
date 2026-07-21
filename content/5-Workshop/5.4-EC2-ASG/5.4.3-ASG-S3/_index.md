---
title: "Configure ASG Warm Pool & S3 Bucket"
date: 2026-05-04
weight: 3
chapter: false
pre: " <b> 5.4.3 </b> "
---

### Configure ASG Warm Pool & S3 Bucket

**Objective:** Create an Auto Scaling Group with a Warm Pool to ensure instances are always ready, and create an S3 Bucket to host the game frontend with static website hosting and CORS.

---

#### Step 1: Create Auto Scaling Group (ASG)

Go to **EC2** → **Auto Scaling Groups** → **Create Auto Scaling group**.

![Figure 5 - Create Auto Scaling Group](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img5.png)

Configure the ASG:

| Field | Value |
|-------|-------|
| Auto Scaling group name | `FightingGameASG` |
| Launch template | `FightingGameServer-LT` |
| Desired capacity | 1 |
| Minimum capacity | 0 |
| Maximum capacity | 5 |

---

#### Step 2: Configure Warm Pool

Configure the Warm Pool:

| Field | Value |
|-------|-------|
| Warm pool instance state | Stopped |
| Min size | 1 |
| Max prepared capacity | Auto |

**Note:** A Warm Pool with **Stopped** state helps save costs while ensuring instances can start quickly when needed.

---

#### Step 3: Create S3 Bucket

Go to **S3** → **Create bucket**.

Configure the Bucket:

| Field | Value |
|-------|-------|
| Bucket name | `fighting-game-frontend-<unique-id>` |
| AWS Region | ap-southeast-1 |
| Block Public Access | ❌ Disabled (for demo) |

---

#### Step 4: Configure Static Website Hosting

Select the Bucket → **Properties** → **Static website hosting** → **Edit**.

![Figure 6 - Static Website Hosting](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img6.png)

| Field | Value |
|-------|-------|
| Static website hosting | Enable |
| Index document | `index.html` |
| Error document | `error.html` |

---

#### Step 5: Configure Bucket Policy (Public Read for Demo)

Select **Permissions** → **Bucket policy** → **Edit**, paste the following policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::fighting-game-frontend-<unique-id>/*"
    }
  ]
}
```

![Figure 7 - Bucket Policy](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img7.png)

---

#### Step 6: Configure CORS

Select **Permissions** → **Cross-origin resource sharing (CORS)** → **Edit**:

```json
[
  {
    "AllowedHeaders": ["*"],
    "AllowedMethods": ["GET", "PUT", "POST"],
    "AllowedOrigins": ["*"],
    "ExposeHeaders": ["ETag"]
  }
]
```

![Figure 8 - CORS Configuration](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img8.png)

Note down the **Website endpoint URL** to configure CloudFront (if needed) or for direct access.

**Result:** ASG with Warm Pool and S3 Bucket have been configured. The game server infrastructure is ready to continue setting up the CI/CD pipeline in step 5.5.

