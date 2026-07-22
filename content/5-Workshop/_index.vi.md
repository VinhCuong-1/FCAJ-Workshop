---
title: "Workshop"
date: 2026-05-04
weight: 5
chapter: false
pre: " <b> 5. </b> "
---

# Hệ thống Backend cho Live-Service Game trên AWS

#### Tổng quan

Trong workshop này, các em sẽ từng bước xây dựng một hệ thống backend hoàn chỉnh cho một tựa game live-service chạy trên AWS, theo kiến trúc **serverless kết hợp với EC2 Spot**. Hệ thống chỉ bật tài nguyên tính toán (compute) khi thực sự cần thiết — đăng nhập, tìm trận (matchmaking), và trong khi trận đấu đang diễn ra.

- **Link web demo:** [http://fighting-game-assets-508768431157.s3-website-ap-southeast-1.amazonaws.com/](http://fighting-game-assets-508768431157.s3-website-ap-southeast-1.amazonaws.com/)
- **Link mã nguồn (Source code):** [https://github.com/VinhCuong-1/fighting-game-master](https://github.com/VinhCuong-1/fighting-game-master)

**Các tài khoản đã tạo:**
- **Player 1:** `tranvinhcuong1` (Mật khẩu: `Cuongxuyentu098!`)
- **Player 2:** `tranvinhcuong` (Mật khẩu: `Cuongxuyentu098!`)

#### Nội dung

1. [Xác thực người dùng với Amazon Cognito](5.1-Cognito/)
2. [Cơ sở dữ liệu DynamoDB: MatchmakingQueue & ActiveMatches](5.2-DynamoDB/)
3. [Matchmaker Lambda & API Gateway REST API](5.3-Lambda-APIGateway/)
4. [Máy chủ game EC2 & Cấu hình ASG Warm Pool](5.4-EC2-ASG/)
5. [Quy trình GitOps CI/CD & Cài đặt AWS CodeDeploy](5.5-CICD-CodeDeploy/)
6. [Xử lý bất đồng bộ sau trận đấu với DynamoDB Streams](5.6-AsyncProcessing/)
7. [Dọn dẹp tài nguyên (Cleanup)](5.7-Cleanup/)