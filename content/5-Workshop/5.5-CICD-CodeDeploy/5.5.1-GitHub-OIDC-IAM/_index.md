---
title: "Configure GitHub OIDC Provider & IAM Roles"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.5.1. </b> "
---

### Configure GitHub OIDC Provider & IAM Roles

**Objective:** Set up GitHub as an OIDC Identity Provider in AWS so GitHub Actions can assume an IAM Role without storing Access Keys in repository secrets.

#### Step 1: Add GitHub as OIDC Provider

Go to **IAM** → **Identity providers** → **Add provider** → select **OpenID Connect** → fill in:
- **Provider URL:** `https://token.actions.githubusercontent.com`
- **Audience:** `sts.amazonaws.com`

![Figure 1](/images/5-Workshop/5.5-CICD/5.5.1/img15.png)

#### Step 2: Attach Permissions Policy to Role

Create or modify the IAM Role for the pipeline, attaching required policies (CodeDeploy, S3 read/write).

![Figure 2](/images/5-Workshop/5.5-CICD/5.5.1/img16.png)

#### Step 3: Configure Role Trust Policy

The Trust Policy allows GitHub Actions to assume this role:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::ACCOUNT_ID:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:YOUR_ORG/YOUR_REPO:*"
        }
      }
    }
  ]
}
```

![Figure 3](/images/5-Workshop/5.5-CICD/5.5.1/img17.png)

#### Step 4: Save ARN to Repo Secret

Save the Role ARN to GitHub Secrets as `AWS_ROLE_ARN` for GitHub Actions to use.

![Figure 4](/images/5-Workshop/5.5-CICD/5.5.1/img18.png)

#### Step 5: Configure FightingGameServerInstanceRole

Create an IAM Role for EC2 instances (FightingGameServerInstanceRole) with S3 artifact read permissions.

![Figure 5](/images/5-Workshop/5.5-CICD/5.5.1/img19.png)
![Figure 6](/images/5-Workshop/5.5-CICD/5.5.1/img20.png)

