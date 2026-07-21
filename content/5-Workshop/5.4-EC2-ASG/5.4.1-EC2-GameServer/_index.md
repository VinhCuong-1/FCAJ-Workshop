---
title: "Launch EC2 Game Server with Node.js"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.4.1. </b> "
---

### Launch EC2 Game Server with Node.js

**Objective:** Launch an EC2 instance running Ubuntu Server 24.04, install the Node.js game server, and verify the connection is successful.

---

#### Step 1: Access EC2

In the Search bar, search for **EC2** → Select **EC2**.

![Figure 86 - Access EC2](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img86.png)

---

#### Step 2: Launch Instance

Select **Launch Instances** to start creating a new server.

![Figure 87 - Launch Instances](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img87.png)

![Figure 88 - Launch Instance overview](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img88.png)

---

#### Step 3: Configure Instance

Fill in the configuration fields according to the table below:

| Field | Value |
|-------|-------|
| Name | `FightingGameServer` |
| AMI | Ubuntu Server 24.04 LTS (HVM), SSD Volume Type |
| Instance type | `t3.small` or `t3.medium` |
| Key pair | Create new or use existing key pair |
| Storage | 8 GB gp3 |

**Security Group Configuration:**

![Figure 89 - Create Security Group](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img89.png)

| Rule | Protocol | Port | Source |
|------|----------|------|--------|
| SSH | TCP | 22 | My IP |
| Custom TCP | TCP | 3000 | 0.0.0.0/0 (Game server port) |
| Custom TCP | TCP | 8080 | 0.0.0.0/0 (WebSocket) |

![Figure 90 - Security Group configuration complete](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img90.png)

Select **Launch Instance** to create.

---

#### Step 4: Set Up Node.js Game Server

SSH into the newly created instance, then install Node.js and start the game server:

![Figure 91 - SSH into instance](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img91.png)

```bash
# Update the system
sudo apt-get update && sudo apt-get upgrade -y

# Install Node.js 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Check versions
node --version
npm --version
```

![Figure 92 - Install Node.js](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img92.png)

```bash
# Clone or upload game server source code
mkdir -p ~/fighting-game-server
cd ~/fighting-game-server

# Install dependencies
npm install

# Configure environment variables
export AWS_REGION=ap-southeast-1
export DYNAMODB_TABLE=ActiveMatches
export PORT=3000
```

![Figure 93 - Install dependencies](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img93.png)

```bash
# Install PM2 for process management
sudo npm install -g pm2

# Start game server
pm2 start server.js --name fighting-game-server

# Configure auto-start on reboot
pm2 startup
pm2 save
```

![Figure 94 - Start PM2](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img94.png)

![Figure 95 - Game server running](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img95.png)

![Figure 96 - PM2 status](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img96.png)

**Note:** The Node.js game server must be in **online** status in PM2 before proceeding to the next step.

---

#### Step 5: Test Connection

Open a browser or use `curl` to verify the game server is running:

```bash
curl http://<EC2-Public-IP>:3000/health
```

![Figure 97 - Test game server connection](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img97.png)

![Figure 98 - Connection successful](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img98.png)

**Result:** EC2 instance `FightingGameServer` is running successfully with the Node.js game server. This instance will be used to create an AMI in the next step.

