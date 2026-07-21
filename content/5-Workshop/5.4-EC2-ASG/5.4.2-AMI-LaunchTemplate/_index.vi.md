---
title: "Đóng gói AMI & Tạo Launch Template"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.4.2. </b> "
---

### Đóng gói AMI & Tạo Launch Template

**Mục tiêu:** Tag EC2 instance, đóng gói AMI từ instance đã cài đặt game server, tạo Launch Template với Spot configuration cho ASG, và cấu hình IAM role cho MatchMaker.

---

#### Bước 1: Tag EC2 Instance

Trước khi tạo AMI, thêm tags vào EC2 instance để dễ quản lý:

![Hình 1 - Tag EC2 Instance](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img1.png)

| Key | Value |
|-----|-------|
| Name | `FightingGameServer` |
| Environment | `Production` |
| Role | `GameServer` |

---

#### Bước 2: Bake AMI từ Instance

Chọn EC2 instance `FightingGameServer` → **Actions** → **Image and templates** → **Create image**.

Điền thông tin AMI:

| Trường | Giá trị |
|--------|---------|
| Image name | `FightingGameServer-AMI-v1` |
| Image description | Game server with Node.js and PM2 pre-installed |
| No reboot | ✅ Bật (để không restart instance) |

Chọn **Create image** → Đợi AMI chuyển trạng thái sang `available`.

![Hình 2 - AMI hoàn tất](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img2.png)

**Lưu ý:** Quá trình tạo AMI có thể mất 5-10 phút. Kiểm tra trạng thái tại **EC2 → AMIs**.

---

#### Bước 3: Tạo Launch Template (Spot)

Truy cập **EC2** → **Launch Templates** → **Create launch template**.

Cấu hình Launch Template:

| Trường | Giá trị |
|--------|---------|
| Launch template name | `FightingGameServer-LT` |
| Template version description | Spot-optimized template |
| AMI | `FightingGameServer-AMI-v1` (vừa tạo) |
| Instance type | `t3.small` |
| Key pair | Key pair hiện có |
| Security group | Security group của FightingGameServer |

**Cấu hình Spot:**

Trong phần **Advanced details** → **Purchasing option**: Chọn **Request Spot instances**.

---

#### Bước 4: Cấu hình IAM cho MatchMaker

Tạo IAM Instance Profile để EC2 có thể truy cập DynamoDB và các dịch vụ AWS:

![Hình 3 - Cấu hình IAM Role cho MatchMaker](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img3.png)

Gắn IAM Instance Profile vào Launch Template:

| Trường | Giá trị |
|--------|---------|
| IAM instance profile | `FightingGameServerInstanceRole` |

![Hình 4 - Launch Template hoàn tất](/images/5-Workshop/5.4-EC2-ASG/5.4.2/img4.png)

Chọn **Create launch template** để hoàn tất.

**Kết quả:** AMI `FightingGameServer-AMI-v1` và Launch Template `FightingGameServer-LT` đã được tạo thành công. Sẵn sàng để cấu hình ASG ở bước tiếp theo.

