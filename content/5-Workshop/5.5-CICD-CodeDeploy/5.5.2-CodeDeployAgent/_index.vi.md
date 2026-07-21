---
title: "Cài đặt CodeDeploy Agent trên Ubuntu 24.04"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.5.2. </b> "
---

### Cài đặt CodeDeploy Agent trên Ubuntu 24.04

**Mục tiêu:** Cài đặt CodeDeploy Agent trên EC2 instance chạy Ubuntu 24.04 LTS. Do Ubuntu 24.04 dùng Ruby 3.3 trong khi package mặc định của AWS khai báo phụ thuộc Ruby 3.2, cần thực hiện patch trước khi cài.

#### Script cài đặt

Kết nối SSH vào EC2 instance và chạy lần lượt các lệnh sau:

```bash
# 1. Cài đặt các gói cần thiết
sudo apt-get update && sudo apt-get install -y ruby-full ruby-webrick wget gdebi-core

# 2. Tải file .deb trực tiếp
cd /tmp
wget https://aws-codedeploy-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/releases/codedeploy-agent_1.8.1-26_all.deb

# 3. Giải nén, sửa khai báo phụ thuộc Ruby và đóng gói lại
dpkg-deb -R codedeploy-agent_1.8.1-26_all.deb /tmp/codedeploy-extracted
sed -i "s/ruby3.2/ruby3.3/g" /tmp/codedeploy-extracted/DEBIAN/control
dpkg-deb -b /tmp/codedeploy-extracted /tmp/codedeploy-agent_fixed.deb

# 4. Cài gói đã patch và khởi động service
sudo dpkg -i /tmp/codedeploy-agent_fixed.deb
sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent
```

**Lưu ý:** Script này cần được áp dụng cho cả **Warm instance** và **Spot instance** trong Launch Template (thêm vào User Data) để các instance mới tự động có CodeDeploy Agent khi boot.

#### Kết quả sau khi cài đặt

![Hình 1](/images/5-Workshop/5.5-CICD/5.5.2/img21.png)
![Hình 2](/images/5-Workshop/5.5-CICD/5.5.2/img22.png)
![Hình 3](/images/5-Workshop/5.5-CICD/5.5.2/img23.png)

#### Cập nhật Launch Template với CodeDeploy Agent

Sau khi cài đặt thành công trên instance hiện tại, cập nhật Launch Template để tất cả instance mới trong Warm Pool và Spot Fleet tự động có agent.

![Hình 4](/images/5-Workshop/5.5-CICD/5.5.2/img24.png)
![Hình 5](/images/5-Workshop/5.5-CICD/5.5.2/img25.png)
![Hình 6](/images/5-Workshop/5.5-CICD/5.5.2/img26.png)
![Hình 7](/images/5-Workshop/5.5-CICD/5.5.2/img27.png)

