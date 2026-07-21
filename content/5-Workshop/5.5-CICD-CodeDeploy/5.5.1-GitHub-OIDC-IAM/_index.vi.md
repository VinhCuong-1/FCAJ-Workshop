---
title: "Cấu hình GitHub OIDC Provider & IAM Roles"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.5.1. </b> "
---

### Cấu hình GitHub OIDC Provider & IAM Roles

**Mục tiêu:** Thiết lập GitHub làm OIDC Identity Provider trong AWS để GitHub Actions có thể assume IAM Role mà không cần lưu Access Key trong repository secrets.

#### Bước 1: Thêm GitHub làm OIDC Provider

Truy cập **IAM** → **Identity providers** → **Add provider** → chọn **OpenID Connect** → điền:
- **Provider URL:** `https://token.actions.githubusercontent.com`
- **Audience:** `sts.amazonaws.com`

![Hình 1](/images/5-Workshop/5.5-CICD/5.5.1/img15.png)

#### Bước 2: Gắn Permissions Policy vào Role

Tạo hoặc chỉnh sửa IAM Role cho pipeline, gắn các policy cần thiết (CodeDeploy, S3 read/write).

![Hình 2](/images/5-Workshop/5.5-CICD/5.5.1/img16.png)

#### Bước 3: Cấu hình Role Trust Policy

Trust Policy cho phép GitHub Actions assume role này. Ví dụ:

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

![Hình 3](/images/5-Workshop/5.5-CICD/5.5.1/img17.png)

#### Bước 4: Lưu ARN vào Repo Secret

Lưu ARN của Role vào GitHub Secrets với tên `AWS_ROLE_ARN` để GitHub Actions sử dụng.

![Hình 4](/images/5-Workshop/5.5-CICD/5.5.1/img18.png)

#### Bước 5: Cấu hình FightingGameServerInstanceRole

Tạo IAM Role cho EC2 instances (FightingGameServerInstanceRole) với quyền đọc S3 artifact.

![Hình 5](/images/5-Workshop/5.5-CICD/5.5.1/img19.png)

Chỉnh sửa IAM Role để thêm policy cần thiết.

![Hình 6](/images/5-Workshop/5.5-CICD/5.5.1/img20.png)

