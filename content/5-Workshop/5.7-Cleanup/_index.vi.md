---
title: "Dọn dẹp tài nguyên"
date: 2026-05-04
weight: 7
chapter: false
pre: " <b> 5.7. </b> "
---

### Dọn dẹp tài nguyên

**Quan trọng:** Sau khi hoàn thành workshop, hãy xóa toàn bộ tài nguyên đã tạo để tránh phát sinh chi phí không mong muốn trên tài khoản AWS.

Thực hiện theo thứ tự sau để tránh lỗi phụ thuộc giữa các dịch vụ:

---

#### 1. Cognito

**Xóa User Pool:**

Vào **Cognito** → **User pools** → chọn User pool đã tạo → **Delete**.

![Hình 1](/images/5-Workshop/5.7-Cleanup/img1.png)
![Hình 2](/images/5-Workshop/5.7-Cleanup/img2.png)

**Xóa Identity Pool:**

Vào **Identity pools** → chọn Identity Pool đã tạo → **Delete**.

![Hình 3](/images/5-Workshop/5.7-Cleanup/img3.png)
![Hình 4](/images/5-Workshop/5.7-Cleanup/img4.png)

---

#### 2. DynamoDB

Vào **DynamoDB** → **Tables** → chọn tất cả các bảng đã tạo (`MatchmakingQueue`, `ActiveMatches`) → **Delete**.

![Hình 5](/images/5-Workshop/5.7-Cleanup/img5.png)
![Hình 6](/images/5-Workshop/5.7-Cleanup/img6.png)

---

#### 3. Lambda

Vào **Lambda** → chọn các Function đã tạo (`FightingGameMatchmaker`, `MatchAnalyticLambda`) → **Delete**.

![Hình 7](/images/5-Workshop/5.7-Cleanup/img7.png)
![Hình 8](/images/5-Workshop/5.7-Cleanup/img8.png)

---

#### 4. API Gateway

Vào **API Gateway** → **APIs** → chọn API đã tạo → **Delete**.

![Hình 9](/images/5-Workshop/5.7-Cleanup/img9.png)
![Hình 10](/images/5-Workshop/5.7-Cleanup/img10.png)

---

#### 5. CloudFront

Vào **CloudFront** → **Distributions** → chọn Distribution đã tạo → **Disable** trước.

![Hình 11](/images/5-Workshop/5.7-Cleanup/img11.png)
![Hình 12](/images/5-Workshop/5.7-Cleanup/img12.png)

**Lưu ý:** Đợi khoảng **5–10 phút** sau khi Disable thì mới có thể Delete.

![Hình 13](/images/5-Workshop/5.7-Cleanup/img13.png)

---

#### 6. WAF & Shield

Vào **WAF & Shield** → **Web ACLs** → chọn `CreatedByCloudFront-56a8180e` → **Actions** → **Manage resources** → **Disassociate** trước → sau đó **Delete**.

![Hình 14](/images/5-Workshop/5.7-Cleanup/img14.png)
![Hình 15](/images/5-Workshop/5.7-Cleanup/img15.png)

---

#### 7. S3

Vào **S3** → chọn Bucket đã tạo → **Empty** (xóa hết object bên trong) → **Delete** (xóa bucket).

![Hình 16 - Dọn dẹp S3 Bucket](/images/5-Workshop/5.7-Cleanup/img16.png)

**Lưu ý:** Phải **Empty** bucket trước, sau đó mới Delete được. Bucket không trống sẽ không thể xóa.

---

#### 8. EC2

Vào **EC2** → chọn các instances đã tạo → **Instance state** → **Stop** → đợi instances dừng hẳn → **Instance state** → **Terminate (delete) instance**.

![Hình 17 - Dọn dẹp EC2 Instances](/images/5-Workshop/5.7-Cleanup/img17.png)

**Lưu ý:** Nếu có ASG, hãy xóa ASG và Launch Template trước khi xóa instances để tránh ASG tự tạo lại instance mới.
