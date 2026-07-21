---
title: "Khởi tạo EC2 Game Server Node.js"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.4.1. </b> "
---

### Khởi tạo EC2 Game Server Node.js

**Mục tiêu:** Khởi tạo EC2 instance với Ubuntu Server 24.04, cài đặt Node.js game server và kiểm tra kết nối thành công.

---

#### Bước 1: Truy cập EC2

Trên thanh Search, tìm **EC2** → Chọn **EC2**.

![Hình 86 - Truy cập EC2](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img86.png)

---

#### Bước 2: Launch Instance

Chọn **Launch Instances** để bắt đầu tạo máy chủ mới.

![Hình 87 - Launch Instances](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img87.png)

![Hình 88 - Tổng quan Launch Instance](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img88.png)

---

#### Bước 3: Cấu hình Instance

Điền các thông tin cấu hình theo bảng sau:

| Trường | Giá trị |
|--------|---------|
| Name | `FightingGameServer` |
| AMI | Ubuntu Server 24.04 LTS (HVM), SSD Volume Type |
| Instance type | `t3.small` hoặc `t3.medium` |
| Key pair | Tạo mới hoặc dùng key pair hiện có |
| Storage | 8 GB gp3 |

**Cấu hình Security Group:**

![Hình 89 - Tạo Security Group](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img89.png)

| Rule | Protocol | Port | Source |
|------|----------|------|--------|
| SSH | TCP | 22 | My IP |
| Custom TCP | TCP | 3000 | 0.0.0.0/0 (Game server port) |
| Custom TCP | TCP | 8080 | 0.0.0.0/0 (WebSocket) |

![Hình 90 - Cấu hình Security Group hoàn tất](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img90.png)

Chọn **Launch Instance** để tạo.

---

#### Bước 4: Chuẩn bị Game Server Node.js

SSH vào instance vừa tạo, sau đó cài đặt Node.js và khởi chạy game server:

![Hình 91 - SSH vào instance](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img91.png)

```bash
# Cập nhật hệ thống
sudo apt-get update && sudo apt-get upgrade -y

# Cài đặt Node.js 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Kiểm tra phiên bản
node --version
npm --version
```

![Hình 92 - Cài đặt Node.js](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img92.png)

```bash
# Clone hoặc upload source code game server
mkdir -p ~/fighting-game-server
cd ~/fighting-game-server

# Cài đặt dependencies
npm install

# Cấu hình biến môi trường
export AWS_REGION=ap-southeast-1
export DYNAMODB_TABLE=ActiveMatches
export PORT=3000
```

![Hình 93 - Cài đặt dependencies](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img93.png)

```bash
# Cài đặt PM2 để quản lý process
sudo npm install -g pm2

# Khởi động game server
pm2 start server.js --name fighting-game-server

# Cấu hình tự khởi động khi reboot
pm2 startup
pm2 save
```

![Hình 94 - Khởi động PM2](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img94.png)

![Hình 95 - Game server đang chạy](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img95.png)

![Hình 96 - PM2 status](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img96.png)

**Lưu ý:** Game server Node.js phải đang ở trạng thái **online** trong PM2 trước khi tiến hành bước tiếp theo.

---

#### Bước 5: Kiểm tra kết nối

Mở trình duyệt hoặc dùng `curl` để kiểm tra game server đang hoạt động:

```bash
curl http://<EC2-Public-IP>:3000/health
```

![Hình 97 - Test kết nối game server](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img97.png)

![Hình 98 - Kết nối thành công](/images/5-Workshop/5.4-EC2-ASG/5.4.1/img98.png)

**Kết quả:** EC2 instance `FightingGameServer` đang chạy thành công với Node.js game server. Instance này sẽ được dùng để tạo AMI ở bước tiếp theo.

