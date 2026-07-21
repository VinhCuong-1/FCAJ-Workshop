---
title: "Cấu hình EC2 Game Server & ASG Warm Pool"
date: 2026-05-04
weight: 4
chapter: false
pre: " <b> 5.4. </b> "
---

### Cấu hình EC2 Game Server & ASG Warm Pool

Phần này hướng dẫn triển khai hạ tầng máy chủ game dựa trên **Amazon EC2**, bao gồm:

- Khởi tạo EC2 instance chạy **game server Node.js**
- Đóng gói **AMI** (Amazon Machine Image) từ instance đã cấu hình
- Tạo **Launch Template** tối ưu cho Spot Fleet
- Cấu hình **Auto Scaling Group (ASG) với Warm Pool** để khởi động nhanh instance
- Tạo **S3 Bucket** lưu trữ file game tĩnh (frontend)

#### Kiến trúc tổng quan

| Thành phần | Mô tả |
|------------|-------|
| EC2 (FightingGameServer) | Instance chạy Node.js game server, xử lý kết nối WebSocket |
| AMI | Image đã được cài đặt sẵn game server, Node.js runtime |
| Launch Template | Template dùng cho ASG với Spot instance |
| ASG + Warm Pool | Tự động scale và duy trì instance để khởi động sẵn |
| S3 Bucket | Lưu trữ và phục vụ frontend game (HTML/JS/CSS) |

#### Các bước thực hiện

1. [Khởi tạo EC2 Game Server Node.js](5.4.1-ec2-gameserver/)
2. [Đóng gói AMI & Tạo Launch Template](5.4.2-ami-launchtemplate/)
3. [Cấu hình ASG Warm Pool & S3 Bucket](5.4.3-asg-s3/)
