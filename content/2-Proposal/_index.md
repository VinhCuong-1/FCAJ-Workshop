---
title: "Proposal"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# Live-Service Game Backend System
## Optimizing Cost and Performance with Serverless and EC2 Spot Architecture

### 1. Executive Summary
This is a backend system for a live-service game running on AWS, designed with a resource-optimization mechanism: compute resources (real servers) are only spun up when strictly necessary, such as for login, matchmaking, and during active gameplay. The entire metagame (login, matchmaking, result saving) is fully operated on a Serverless architecture, while the live game session utilizes an EC2 Spot fleet and is only spun up upon Matchmaker request. Deployment and updates are fully automated via GitOps, ensuring high stability and security.

### 2. Problem Statement
**What's the Problem?**
In traditional live-service games, maintaining 24/7 game servers (standing servers) causes resource waste and massive costs, especially during idle times when no one is playing. Manual deployment to production often harbors downtime risks and negatively impacts the experience of players currently in a match.

**The Solution**
The system solves this using the rule: "Serverless for everything except live game sessions".
- The metagame (login, matchmaking, result recording) runs serverless.
- Live game sessions sit behind a dedicated network boundary within a VPC, completely isolated from the auth and matchmaking flows. EC2 Spot instances are only activated (spun up) upon request.
- Uses GitOps for CI/CD for automated updates, ensuring gradual traffic shifting without crashing ongoing matches.

**Benefits and Return on Investment (ROI)**
- **Cost Optimization:** No NAT Gateway, no permanent Load Balancers. The game fleet utilizes EC2 Spot Instances on Graviton ARM64 processors to maximize savings. Compute only lives when a match exists.
- **Operational Optimization:** AMIs are extremely thin because artifacts are centralized on S3; updating the server bundle does not require rebaking the AMI for every minor patch.
- **Absolute Security:** The lifespan of compute, network access permissions, and credential scopes perfectly coincide with the time a play session actually needs them—no more, no less.

### 3. Solution Architecture
The architecture is divided into four distinct flows, each with its own trigger and trust boundary:

**Flow C (CI/CD - GitOps):** Runs during deployment, untouched by ongoing matches. A GitOps pipeline (GitHub Actions) builds artifacts -> CodeDeploy shifts traffic to a new Lambda alias and updates the template for EC2. Client builds, patches, and server bundles are uploaded to S3.

**Flow A (Authentication & Asset Distribution):** Players log in via Cognito User Pool -> receive JWT. Cognito Identity Pool exchanges the JWT for temporary IAM credentials (scoped by prefix) to download assets directly from S3.

**Flow R (Main Request - Synchronous):** The client sends a matchmaking request via CloudFront (WAF) -> API Gateway verifies the JWT -> Matchmaker Lambda (in private subnet) writes the match state to DynamoDB and calls the EC2 control plane via VPC Interface Endpoint to request a warm instance from the Spot ASG. Lambda adds SG rules for each player and returns IP/Port. Client connects directly to the game instance via Internet Gateway.

**Flow E (Post-Match - Asynchronous):** Results are written to DynamoDB -> DynamoDB Streams trigger a background Lambda to process logs and push to analytics. Completely isolated so as not to affect the latency of Flow R.

![Game Live-Service Architecture](/images/2-Proposal/architecture.png)

**AWS Services Used**
- **Amazon EC2 (Spot Instances - Graviton):** Runs live game sessions.
- **AWS Lambda & API Gateway:** Handles matchmaking logic and post-match event processing.
- **Amazon S3:** Centralized artifact storage for client and server.
- **Amazon Cognito:** Authenticates users and provisions temporary IAM credentials.
- **Amazon DynamoDB:** Stores match states and results.
- **Amazon CloudFront & WAF:** Distributes requests and secures endpoints.
- **AWS CodeDeploy:** Manages traffic shifting and version updates.

**Component Design**
- Matchmaker Lambda operates in a Private Subnet, communicating with DynamoDB and EC2 APIs via VPC Endpoints (no public internet exposure).
- When EC2 (Spot) boots, User Data uses an IAM Instance Profile (flow G4) to pull the latest server binary from S3 and gets ready to receive players (flow G3).

### 4. Technical Implementation
**Implementation Phases**
1. **Infrastructure Design & Permissions:** Build VPC, Private/Public Subnets, VPC Endpoints, configure Cognito and IAM roles (Instance Profiles, Scoped Temp Credentials).
2. **CI/CD Pipeline (GitOps):** Configure GitHub Actions, AWS CodeDeploy, and S3 buckets for automated build/deploy.
3. **Serverless Flow Development:** Write Lambda for matchmaking, integrate API Gateway, CloudFront, and WAF. Configure DynamoDB and DynamoDB Streams for post-match processing.
4. **Game Fleet Configuration:** Set up Auto Scaling Group (ASG) for EC2 Spot (Graviton), configure User Data scripts to pull server bundles from S3 on boot.
5. **Testing & Optimization:** Load testing, testing traffic shifting, rollbacks, and monitoring via CloudWatch.

### 5. Timeline & Milestones
- **Month 1:** Finalize network architecture (VPC, Endpoints) and authentication system (Cognito).
- **Month 2:** Setup CI/CD flow (GitOps) and Asset distribution mechanism via S3.
- **Month 3:** Develop Serverless logic (Matchmaking Lambda, DynamoDB) and configure EC2 Spot Fleet.
- **Month 4:** Full system integration, security testing (WAF, IAM Roles), load testing, and go-live.

### 6. Budget Estimation
Since the system follows a "compute-on-demand" model, the baseline cost is extremely low:
- **EC2 Spot (Graviton):** Savings up to 70-90% compared to On-demand, only incurred when matches are active.
- **Lambda, API Gateway, DynamoDB:** Pay-as-you-go, no matches mean no compute cost.
- **S3 & CloudFront:** Cheap storage and data transfer costs.
- **No costs for:** The system completely eliminates NAT Gateways and permanent Load Balancers (since clients connect directly via dynamic SG rules).

### 7. Risk Assessment
**Risk Matrix**
- **EC2 Spot Interruption:** High impact, medium probability.
- **New Version Deployment Errors:** Medium impact, low probability (thanks to GitOps and gradual traffic shifting).

**Mitigation Strategies**
- **Spot Interruption:** Design game logic for fast reconnects or fallback to other instances.
- **Deployment:** Use Blue/Green deployment or Linear traffic shifting via CodeDeploy.

**Contingency Plans**
- Instant rollback of Lambda versions and AMIs if production errors are detected via GitOps, without crashing running matches.

### 8. Expected Outcomes
- **Technical Improvements:** Complete elimination of standing server maintenance costs. High-security system with clear separation between auth, serverless logic, and game nodes.
- **Long-term Value:** An infinitely scalable architecture that serves as a standard foundation for running low-cost live-service games while ensuring low latency and high availability.