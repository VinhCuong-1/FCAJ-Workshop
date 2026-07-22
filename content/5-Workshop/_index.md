---
title: "Workshop"
date: 2026-05-04
weight: 5
chapter: false
pre: " <b> 5. </b> "
---

# Live-Service Game Backend System on AWS

#### Overview

In this workshop, you will step by step build a complete backend system for a live-service game running on AWS, following a **serverless combined with EC2 Spot** architecture. The system only turns on compute when truly needed � login, matchmaking, and while a match is in progress.

- **Web demo link:** [http://fighting-game-assets-508768431157.s3-website-ap-southeast-1.amazonaws.com/](http://fighting-game-assets-508768431157.s3-website-ap-southeast-1.amazonaws.com/)
- **Source code link:** [https://github.com/VinhCuong-1/fighting-game-master](https://github.com/VinhCuong-1/fighting-game-master)

**Created Accounts:**
- **Player 1:** `tranvinhcuong1` (Password: `Cuongxuyentu098!`)
- **Player 2:** `tranvinhcuong` (Password: `Cuongxuyentu098!`)

#### Contents

1. [User Authentication with Amazon Cognito](5.1-Cognito/)
2. [DynamoDB Database: MatchmakingQueue & ActiveMatches](5.2-DynamoDB/)
3. [Matchmaker Lambda & API Gateway REST API](5.3-Lambda-APIGateway/)
4. [EC2 Game Server & ASG Warm Pool Configuration](5.4-EC2-ASG/)
5. [GitOps CI/CD Pipeline & AWS CodeDeploy Setup](5.5-CICD-CodeDeploy/)
6. [Asynchronous Post-Match Processing with DynamoDB Streams](5.6-AsyncProcessing/)
7. [Cleanup Resources](5.7-Cleanup/)