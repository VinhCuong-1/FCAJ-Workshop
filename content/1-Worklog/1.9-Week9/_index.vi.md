---
title: "Worklog Tuần 9"
date: 2026-05-04
weight: 9
chapter: false
pre: " <b> 1.9. </b> "
---
### Mục tiêu Tuần 9:

* Hoàn thành các bài học còn lại trong "Container services" bao gồm container hóa và di chuyển các ứng dụng monolith sang microservices và xây dựng các pipeline CI/CD.
* Khám phá và làm quen với các khái niệm và dịch vụ cốt lõi của "Data & Analytics" và "AI/ML services" trên AWS.
* Xây dựng kiến trúc Data Lake, thực hiện phân tích dữ liệu, trực quan hóa dữ liệu với Amazon QuickSight, và bắt đầu với Amazon SageMaker.

### Các nhiệm vụ cần thực hiện trong tuần này:
| Ngày | Nhiệm vụ | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
| --- | --- | --- | --- | --- |
| 2   | - Từ Monolith sang Microservices với Docker và AWS Fargate | 29/06/2026 | 29/06/2026 | <https://cloudjourney.awsstudygroup.com/> |
| 3   | - CI/CD trên EKS với CodePipeline và GitHub | 30/06/2026 | 30/06/2026 | <https://cloudjourney.awsstudygroup.com/> |
| 4   | - Xây dựng một Data lake trên AWS | 01/07/2026 | 01/07/2026 | <https://cloudjourney.awsstudygroup.com/> |
| 5   | - Xây dựng một Datalake với dữ liệu của riêng em | 02/07/2026 | 02/07/2026 | <https://cloudjourney.awsstudygroup.com/> |
| 6   | - Các dịch vụ phân tích dữ liệu trên AWS | 03/07/2026 | 03/07/2026 | <https://cloudjourney.awsstudygroup.com/> |
| 7   | - Bắt đầu với Amazon QuickSight | 04/07/2026 | 04/07/2026 | <https://cloudjourney.awsstudygroup.com/> |
| CN | - Bắt đầu với Amazon SageMaker | 05/07/2026 | 05/07/2026 | <https://cloudjourney.awsstudygroup.com/> |

### Thành tựu Tuần 9:

* **Dịch vụ Container & Pipeline CI/CD:**
  * Di chuyển thành công các ứng dụng từ kiến trúc Monolithic sang Microservices sử dụng Docker và chạy các triển khai serverless trên AWS Fargate.
  * Thiết lập các pipeline Tích hợp Liên tục và Triển khai Liên tục (CI/CD) tự động cho các ứng dụng chạy trên Amazon EKS bằng AWS CodePipeline tích hợp với GitHub.

* **Xây dựng Data Lake & Xử lý Dữ liệu:**
  * Thiết lập một kiến trúc lưu trữ Data Lake tập trung trên Amazon S3 với việc phân vùng khu vực được tối ưu hóa (Raw, Processed, Curated zones).
  * Cấu hình và tải thành công các tập dữ liệu cá nhân tùy chỉnh vào Data Lake.

* **Phân tích & Trực quan hóa Dữ liệu:**
  * Nắm vững các dịch vụ phân tích cốt lõi của AWS, bao gồm Amazon Athena, AWS Glue, và Amazon Redshift.
  * Kết nối kết quả truy vấn của Amazon Athena tới Amazon QuickSight, thiết kế các bảng điều khiển trực quan để theo dõi các số liệu chính.

* **Học máy (Machine Learning) với Amazon SageMaker:**
  * Hiểu rõ vòng đời Học máy từ đầu đến cuối trên AWS sử dụng Amazon SageMaker, bao gồm chuẩn bị dữ liệu, huấn luyện mô hình, và triển khai endpoint trực tuyến.
