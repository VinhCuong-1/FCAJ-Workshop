---
title: "User Authentication with Amazon Cognito"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.1. </b> "
---

### User Authentication with Amazon Cognito

Amazon Cognito is AWS's user identity management service. In this game system, Cognito handles two main roles:
- **User Pool**: Manages player accounts, registration, login, and JWT token issuance.
- **Identity Pool**: Exchanges JWT for temporary IAM credentials so the client can directly download assets from S3.

#### Steps

1. [Create Cognito User Pool](5.1.1-UserPool/)
2. [Configure App Client & Identity Pool](5.1.2-AppClient-IdentityPool/)
3. [Test User Registration Interface](5.1.3-TestUI/)
