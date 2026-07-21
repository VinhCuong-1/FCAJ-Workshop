---
title: "GitOps CI/CD Pipeline & AWS CodeDeploy Setup"
date: 2026-05-04
weight: 5
chapter: false
pre: " <b> 5.5. </b> "
---

### GitOps CI/CD Pipeline & AWS CodeDeploy Setup

The GitOps pipeline automates the entire process from when a developer pushes code to when it deploys to production without manual intervention. The architecture uses GitHub Actions combined with AWS CodeDeploy in a **no long-lived credentials** model (no static Access Keys).

| Component | Role |
|-----------|------|
| GitHub OIDC | Authenticates GitHub Actions with AWS without long-lived keys |
| IAM Roles | Minimal permissions for pipeline and EC2 instances |
| CodeDeploy Agent | Agent running on EC2 to receive and execute deployments |
| Auto Scaling Group | Manages Spot fleet, ensures warm pool is always ready |

#### Steps

1. [Configure GitHub OIDC Provider & IAM Roles](5.5.1-GitHub-OIDC-IAM/)
2. [Install CodeDeploy Agent on Ubuntu 24.04](5.5.2-CodeDeployAgent/)
3. [Create CodeDeploy App & Deploy Pipeline](5.5.3-Pipeline/)
