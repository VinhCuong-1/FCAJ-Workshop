---
title: "Tạo CodeDeploy App & Triển khai Pipeline"
date: 2026-05-04
weight: 3
chapter: false
pre: " <b> 5.5.3. </b> "
---

### Tạo CodeDeploy App & Triển khai Pipeline

**Mục tiêu:** Tạo CodeDeploy Application và Deployment Group, sau đó kiểm tra pipeline chạy thành công từ GitHub Actions đến EC2.

#### Bước 1: Tạo Role cho CodeDeploy

Tạo IAM Role cho CodeDeploy service với trust policy cho phép `codedeploy.amazonaws.com`.

![Hình 1](/images/5-Workshop/5.5-CICD/5.5.3/img28.png)

#### Bước 2: Tạo CodeDeploy Application

Vào **CodeDeploy** → **Applications** → **Create application** → chọn compute platform **EC2/On-premises**.

![Hình 2](/images/5-Workshop/5.5-CICD/5.5.3/img29.png)

#### Bước 3: Tạo Deployment Group

Tạo Deployment Group, chọn:
- **Service role:** IAM Role vừa tạo
- **Deployment type:** In-place
- **Environment configuration:** Amazon EC2 Auto Scaling groups → chọn ASG

![Hình 3](/images/5-Workshop/5.5-CICD/5.5.3/img30.png)

#### Bước 4: Chạy Pipeline

Sau khi cấu hình xong, push code lên GitHub để kích hoạt pipeline. GitHub Actions sẽ build artifact và gọi CodeDeploy.

![Hình 4 - Fleet working](/images/5-Workshop/5.5-CICD/5.5.3/img31.png)

Deploy thành công.

![Hình 5 - Deploy Success](/images/5-Workshop/5.5-CICD/5.5.3/img32.png)

#### Kết quả

Pipeline hoàn chỉnh: push code → GitHub Actions build → CodeDeploy deploy → EC2 fleet cập nhật mà không downtime.

![Hình 6 - Deployment history](/images/5-Workshop/5.5-CICD/5.5.3/img33.png)

**Lưu ý:** Khi có version mới, CodeDeploy shift traffic từ từ (Blue/Green hoặc Linear), đảm bảo các trận đang diễn ra không bị ảnh hưởng.

