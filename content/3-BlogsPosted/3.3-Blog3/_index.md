---
title: "Blog 3"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 3.3. </b> "
---
# Provisioning 250+ AWS Accounts & AI Dashboard in 4 Hours

To address the challenge of provisioning infrastructure for 500+ Hackathon participants while ensuring internal data security, the engineering team completely eliminated manual processes. Instead, they applied the principles of Infrastructure as Code (IaC) automation and Serverless with three core architectural layers:

Below is the architecture diagram of the automated account provisioning and self-service dashboard:

![Innovation Sandbox and Dashboard Architecture on AWS](/images/3-BlogsPosted/image_sandbox.png)

### 1. Governance & Isolation Layer
Leveraging AWS Organizations and the Innovation Sandbox platform. All new accounts are placed into a specialized Organizational Unit (OU). The system uses SCPs (Service Control Policies) to lock down permissions—only allowing calls to Amazon Bedrock and SageMaker APIs, and blocking all unrelated or expensive services.

### 2. Automated Provisioning Layer
Deploying AWS Control Tower Automate Account Creation. The system utilizes CloudFormation to call AWS Service Catalog APIs directly to create multiple accounts in parallel. Provisioning time is reduced from "hours" to just "seconds" per account.

### 3. AI Dashboard Layer (Serverless)
Building a web application for user self-service queries (Knowledge Base) and real-time progress tracking for leadership.

* **Frontend:** Stored statically on S3 and distributed at high speed via CloudFront.
* **Backend:** API Gateway connects to Lambda to trigger Amazon Q Business. This AI assistant automatically generates a secure Anonymous URL to return the chart dashboard and chat interface to the user.

### Execution Results (Tech Impact)
Successfully deployed 246 enterprise-grade AWS Accounts in less than 4 hours. Thanks to a 100% Serverless design and automatic Sandbox cleanup mechanisms, the system incurs zero compute costs when idle.

Combining AWS Control Tower and the Serverless ecosystem is an exceptionally clean pattern for Massive Account Provisioning. Feel free to share your views and hands-on experiences in the comments regarding provisioning independent accounts (to isolate risk) versus sharing a single account and defining boundaries using IAM Roles.

### References
* **Original article link:** [Innovation Sandbox on AWS with real-time analytics dashboard](https://aws.amazon.com/vi/blogs/mt/innovation-sandbox-on-aws-with-real-time-analytics-dashboard/)