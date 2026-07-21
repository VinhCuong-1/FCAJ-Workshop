---
title: "Install CodeDeploy Agent on Ubuntu 24.04"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.5.2. </b> "
---

### Install CodeDeploy Agent on Ubuntu 24.04

**Objective:** Install the CodeDeploy Agent on an EC2 instance running Ubuntu 24.04 LTS. Since Ubuntu 24.04 uses Ruby 3.3 while AWS's default package declares a Ruby 3.2 dependency, a patch is required before installation.

#### Installation Script

SSH into the EC2 instance and run the following commands:

```bash
# 1. Install prerequisites
sudo apt-get update && sudo apt-get install -y ruby-full ruby-webrick wget gdebi-core

# 2. Download raw .deb package directly
cd /tmp
wget https://aws-codedeploy-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/releases/codedeploy-agent_1.8.1-26_all.deb

# 3. Unpack, fix Ruby dependency declaration, and repack
dpkg-deb -R codedeploy-agent_1.8.1-26_all.deb /tmp/codedeploy-extracted
sed -i "s/ruby3.2/ruby3.3/g" /tmp/codedeploy-extracted/DEBIAN/control
dpkg-deb -b /tmp/codedeploy-extracted /tmp/codedeploy-agent_fixed.deb

# 4. Install patched package and start service
sudo dpkg -i /tmp/codedeploy-agent_fixed.deb
sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent
```

**Note:** This script must be applied to both **Warm instances** and **Spot instances** in the Launch Template (add to User Data) so new instances automatically have the CodeDeploy Agent on boot.

#### Results after installation

![Figure 1](/images/5-Workshop/5.5-CICD/5.5.2/img21.png)

#### Update Launch Template with CodeDeploy Agent

After successful installation on the current instance, update the Launch Template so that all new instances in Warm Pool and Spot Fleet automatically have the agent.
