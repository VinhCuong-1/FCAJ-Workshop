---
title: "Cấu hình ASG Warm Pool & S3 Bucket"
date: 2026-05-04
weight: 3
chapter: false
pre: " <b> 5.4.3 </b> "
---

### Cấu hình ASG Warm Pool & S3 Bucket

**Mục tiêu:** Tạo Auto Scaling Group với Warm Pool để đảm bảo instance luôn sẵn sàng, đồng thời tạo S3 Bucket lưu trữ frontend game với static website hosting và CORS.

---

#### Bước 1: Tạo Auto Scaling Group (ASG)

Truy cập **EC2** → **Auto Scaling Groups** → **Create Auto Scaling group**.

![Hình 8 - Tạo Auto Scaling Group](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img8.png)

Cấu hình ASG:

| Trường | Giá trị |
|--------|---------|
| Auto Scaling group name | `FightingGameASG` |
| Launch template | `FightingGameServer-LT` |
| Desired capacity | 1 |
| Minimum capacity | 0 |
| Maximum capacity | 5 |

---

#### Bước 2: Cấu hình Warm Pool

Sau khi tạo ASG, chọn **Instance management** → **Warm pool** → **Create warm pool**.

![Hình 9 - Tạo Warm Pool](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img9.png)

Cấu hình Warm Pool:

| Trường | Giá trị |
|--------|---------|
| Warm pool instance state | Stopped |
| Min size | 1 |
| Max prepared capacity | Auto |

![Hình 10 - Cấu hình Warm Pool](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img10.png)

**Lưu ý:** Warm Pool với trạng thái **Stopped** giúp tiết kiệm chi phí trong khi vẫn đảm bảo instance sẵn sàng khởi động nhanh khi cần.

---

#### Bước 3: Tạo S3 Bucket

Truy cập **S3** → **Create bucket**.

![Hình 11 - Tạo S3 Bucket](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img11.png)

Cấu hình Bucket:

| Trường | Giá trị |
|--------|---------|
| Bucket name | `fighting-game-frontend-<unique-id>` |
| AWS Region | ap-southeast-1 |
| Block Public Access | ❌ Tắt (cho demo) |

---

#### Bước 4: Cấu hình Static Website Hosting

Chọn Bucket → **Properties** → **Static website hosting** → **Edit**.

![Hình 12 - Static Website Hosting](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img12.png)

| Trường | Giá trị |
|--------|---------|
| Static website hosting | Enable |
| Index document | `index.html` |
| Error document | `error.html` |

---

#### Bước 5: Cấu hình Bucket Policy (Public Read for Demo)

Chọn **Permissions** → **Bucket policy** → **Edit**, dán policy sau:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::fighting-game-frontend-<unique-id>/*"
    }
  ]
}
```

![Hình 13 - Bucket Policy](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img13.png)

---

#### Bước 6: Cấu hình CORS

Chọn **Permissions** → **Cross-origin resource sharing (CORS)** → **Edit**:

```json
[
  {
    "AllowedHeaders": ["*"],
    "AllowedMethods": ["GET", "PUT", "POST"],
    "AllowedOrigins": ["*"],
    "ExposeHeaders": ["ETag"]
  }
]
```

![Hình 14 - CORS Configuration](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img14.png)

![Hình 15 - S3 Bucket hoàn tất](/images/5-Workshop/5.4-EC2-ASG/5.4.3/img15.png)

Ghi lại **Website endpoint URL** để cấu hình CloudFront (nếu cần) hoặc truy cập trực tiếp.

**Kết quả:** ASG với Warm Pool và S3 Bucket đã được cấu hình xong. Hạ tầng game server sẵn sàng để tiếp tục thiết lập CI/CD pipeline ở bước 5.5.

