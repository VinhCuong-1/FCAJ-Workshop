---
title: "Configure EC2 Game Server & ASG Warm Pool"
date: 2026-05-04
weight: 4
chapter: false
pre: " <b> 5.4. </b> "
---

### Configure EC2 Game Server & ASG Warm Pool

This section guides you through deploying the game server infrastructure based on **Amazon EC2**, including:

- Launching an EC2 instance running a **Node.js game server**
- Creating an **AMI** (Amazon Machine Image) from the configured instance
- Building a **Launch Template** optimized for Spot Fleet
- Configuring an **Auto Scaling Group (ASG) with Warm Pool** for fast instance startup
- Creating an **S3 Bucket** to host static game files (frontend)

#### Architecture Overview

| Component | Description |
|-----------|-------------|
| EC2 (FightingGameServer) | Instance running Node.js game server, handling WebSocket connections |
| AMI | Pre-configured image with game server and Node.js runtime installed |
| Launch Template | Template used by ASG with Spot instances |
| ASG + Warm Pool | Automatically scales and maintains pre-started instances |
| S3 Bucket | Hosts and serves the game frontend (HTML/JS/CSS) |

#### Steps

1. [Launch EC2 Game Server with Node.js](5.4.1-EC2-GameServer/)
2. [Create AMI & Launch Template](5.4.2-AMI-LaunchTemplate/)
3. [Configure ASG Warm Pool & S3 Bucket](5.4.3-ASG-S3/)
