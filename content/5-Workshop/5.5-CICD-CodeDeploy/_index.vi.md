---
title: "Quy trình GitOps CI/CD & Cài đặt AWS CodeDeploy"
date: 2026-05-04
weight: 5
chapter: false
pre: " <b> 5.5. </b> "
---

### Quy trình GitOps CI/CD & Cài đặt AWS CodeDeploy

Quy trình GitOps tự động hóa toàn bộ quá trình từ khi lập trình viên đẩy mã nguồn (push code) cho đến khi triển khai lên môi trường production mà không cần can thiệp thủ công. Kiến trúc này sử dụng GitHub Actions kết hợp với AWS CodeDeploy theo mô hình **không sử dụng thông tin xác thực dài hạn (no long-lived credentials)** (không dùng Access Keys tĩnh).

| Thành phần (Component) | Vai trò (Role) |
|-----------|------|
| GitHub OIDC | Xác thực GitHub Actions với AWS mà không cần khóa dài hạn |
| IAM Roles | Cấp quyền tối thiểu cho pipeline và các instance EC2 |
| CodeDeploy Agent | Agent chạy trên EC2 để nhận và thực thi các bản triển khai |
| Auto Scaling Group | Quản lý đội máy chủ (fleet) Spot, đảm bảo warm pool luôn sẵn sàng |

#### Các bước thực hiện

1. [Cấu hình GitHub OIDC Provider & IAM Roles](5.5.1-GitHub-OIDC-IAM/)
2. [Cài đặt CodeDeploy Agent trên Ubuntu 24.04](5.5.2-CodeDeployAgent/)
3. [Tạo CodeDeploy App & Triển khai Pipeline](5.5.3-Pipeline/)
