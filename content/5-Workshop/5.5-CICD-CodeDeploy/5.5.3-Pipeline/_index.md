---
title: "Create CodeDeploy App & Deploy Pipeline"
date: 2026-05-04
weight: 3
chapter: false
pre: " <b> 5.5.3. </b> "
---

### Create CodeDeploy App & Deploy Pipeline

**Objective:** Create a CodeDeploy Application and Deployment Group, then verify the pipeline runs successfully from GitHub Actions to EC2.

#### Step 1: Create Role for CodeDeploy

Create an IAM Role for the CodeDeploy service with a trust policy allowing `codedeploy.amazonaws.com`.

![Figure 1](/images/5-Workshop/5.5-CICD/5.5.3/img28.png)

#### Step 2: Create CodeDeploy Application

Go to **CodeDeploy** → **Applications** → **Create application** → select compute platform **EC2/On-premises**.

![Figure 2](/images/5-Workshop/5.5-CICD/5.5.3/img29.png)

#### Step 3: Create Deployment Group

Create a Deployment Group, selecting:
- **Service role:** The IAM Role just created
- **Deployment type:** In-place
- **Environment configuration:** Amazon EC2 Auto Scaling groups → select ASG

![Figure 3](/images/5-Workshop/5.5-CICD/5.5.3/img30.png)

#### Step 4: Run Pipeline

After configuration, push code to GitHub to trigger the pipeline. GitHub Actions will build the artifact and call CodeDeploy.

![Figure 4 - Fleet working](/images/5-Workshop/5.5-CICD/5.5.3/img31.png)

Deploy successful.

![Figure 5 - Deploy Success](/images/5-Workshop/5.5-CICD/5.5.3/img32.png)

#### Result

Complete pipeline: push code → GitHub Actions build → CodeDeploy deploy → EC2 fleet updated with zero downtime.

![Figure 6 - Deployment history](/images/5-Workshop/5.5-CICD/5.5.3/img33.png)

**Note:** When a new version is available, CodeDeploy shifts traffic gradually (Blue/Green or Linear), ensuring ongoing matches are not affected.

