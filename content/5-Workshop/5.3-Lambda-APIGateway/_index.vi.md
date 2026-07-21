---
title: "Matchmaker Lambda & API Gateway REST API"
date: 2026-05-04
weight: 3
chapter: false
pre: " <b> 5.3. </b> "
---

### Matchmaker Lambda & API Gateway REST API

Matchmaker Lambda là bộ não của hệ thống tìm trận (matchmaking). Hàm này xử lý 2 yêu cầu từ client:
- `POST /join` — Thêm người chơi vào `MatchmakingQueue`
- `GET /check` — Kiểm tra xem người chơi đã được ghép trận trong `ActiveMatches` hay chưa

API Gateway đóng vai trò là cổng duy nhất tiếp nhận các yêu cầu từ client, được tích hợp với **Cognito Authorizer** để bảo vệ endpoint.

#### Các bước thực hiện

1. [Xây dựng hàm Matchmaker Lambda](5.3.1-MatchmakerLambda/)
2. [Triển khai REST API & Cognito Authorizer](5.3.2-RESTAPI-Authorizer/)
