---
title: "Matchmaker Lambda & API Gateway REST API"
date: 2026-05-04
weight: 3
chapter: false
pre: " <b> 5.3. </b> "
---

### Matchmaker Lambda & API Gateway REST API

The Matchmaker Lambda is the brain of the matchmaking system. This function handles 2 requests from the client:
- `POST /join` — Adds the player to `MatchmakingQueue`
- `GET /check` — Checks if the player has been matched in `ActiveMatches`

API Gateway serves as the single gateway accepting requests from clients, integrated with a **Cognito Authorizer** to protect the endpoint.

#### Steps

1. [Build Matchmaker Lambda Function](5.3.1-MatchmakerLambda/)
2. [Deploy REST API & Cognito Authorizer](5.3.2-RESTAPI-Authorizer/)
