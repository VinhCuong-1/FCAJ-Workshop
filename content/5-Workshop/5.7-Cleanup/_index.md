---
title: "Cleanup Resources"
date: 2026-05-04
weight: 7
chapter: false
pre: " <b> 5.7. </b> "
---

### Cleanup Resources

**Important:** After completing the workshop, delete all created resources to avoid unexpected costs on your AWS account.

Follow this order to avoid dependency errors between services:

---

#### 1. Cognito

**Delete User Pool:**

Go to **Cognito** → **User pools** → select the created User pool → **Delete**.

![Figure 1](/images/5-Workshop/5.7-Cleanup/img1.png)
![Figure 2](/images/5-Workshop/5.7-Cleanup/img2.png)

**Delete Identity Pool:**

Go to **Identity pools** → select the created Identity Pool → **Delete**.

![Figure 3](/images/5-Workshop/5.7-Cleanup/img3.png)
![Figure 4](/images/5-Workshop/5.7-Cleanup/img4.png)

---

#### 2. DynamoDB

Go to **DynamoDB** → **Tables** → select all created tables (`MatchmakingQueue`, `ActiveMatches`) → **Delete**.

![Figure 5](/images/5-Workshop/5.7-Cleanup/img5.png)
![Figure 6](/images/5-Workshop/5.7-Cleanup/img6.png)

---

#### 3. Lambda

Go to **Lambda** → select the created Functions (`FightingGameMatchmaker`, `MatchAnalyticLambda`) → **Delete**.

![Figure 7](/images/5-Workshop/5.7-Cleanup/img7.png)
![Figure 8](/images/5-Workshop/5.7-Cleanup/img8.png)

---

#### 4. API Gateway

Go to **API Gateway** → **APIs** → select the created API → **Delete**.

![Figure 9](/images/5-Workshop/5.7-Cleanup/img9.png)
![Figure 10](/images/5-Workshop/5.7-Cleanup/img10.png)

---

#### 5. CloudFront

Go to **CloudFront** → **Distributions** → select the created Distribution → **Disable** first.

![Figure 11](/images/5-Workshop/5.7-Cleanup/img11.png)
![Figure 12](/images/5-Workshop/5.7-Cleanup/img12.png)

**Note:** Wait approximately **5-10 minutes** after disabling before you can delete.

![Figure 13](/images/5-Workshop/5.7-Cleanup/img13.png)

---

#### 6. WAF & Shield

Go to **WAF & Shield** → **Web ACLs** → select `CreatedByCloudFront-56a8180e` → **Actions** → **Manage resources** → **Disassociate** first → then **Delete**.

![Figure 14](/images/5-Workshop/5.7-Cleanup/img14.png)
![Figure 15](/images/5-Workshop/5.7-Cleanup/img15.png)

---

#### 7. S3

Go to **S3** → select the created Bucket → **Empty** (delete all objects inside) → **Delete** (delete the bucket).

![Figure 16 - S3 Bucket Cleanup](/images/5-Workshop/5.7-Cleanup/img16.png)

**Note:** You must **Empty** the bucket first, then Delete. A non-empty bucket cannot be deleted.

---

#### 8. EC2

Go to **EC2** → select the created instances → **Instance state** → **Stop** → wait for instances to fully stop → **Instance state** → **Terminate (delete) instance**.

![Figure 17 - EC2 Instances Cleanup](/images/5-Workshop/5.7-Cleanup/img17.png)

**Note:** If you have an ASG, delete the ASG and Launch Template before deleting instances to prevent the ASG from creating new instances.
