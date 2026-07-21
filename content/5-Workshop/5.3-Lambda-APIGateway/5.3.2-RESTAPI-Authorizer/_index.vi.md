---
title: "Triển khai REST API & Cognito Authorizer"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.3.2. </b> "
---

### Triển khai REST API & Cognito Authorizer

**Mục tiêu:** Tạo REST API với resource `/join` (POST) và `/check` (GET), bảo vệ bằng Cognito Authorizer, bật CORS và deploy lên stage `prod`.

#### Bước 1: Tạo API và chọn REST API

Tại API Gateway, chọn **Create an API** → chọn **REST API**.

![Hình 54](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img54.png)
![Hình 55](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img55.png)
![Hình 56](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img56.png)

Điền các thiết lập → chọn **Create API**.

![Hình 57](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img57.png)
![Hình 58 - Tạo API thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img58.png)

#### Bước 2: Tạo Resource `/join` và Method POST

Chọn **Create resource** → Resource name: `join`.

![Hình 59](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img59.png)
![Hình 60](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img60.png)
![Hình 61](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img61.png)

Tạo Method **POST** và tích hợp Lambda `FightingGameMatchmaker`.

![Hình 62](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img62.png)
![Hình 63](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img63.png)
![Hình 64](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img64.png)
![Hình 65 - Tạo method thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img65.png)

#### Bước 3: Tạo Resource `/check` và Method GET

Tạo tiếp resource `/check`, tương tự nhưng chọn **GET**.

![Hình 66](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img66.png)
![Hình 67](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img67.png)
![Hình 68](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img68.png)
![Hình 69](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img69.png)
![Hình 70 - Tạo /check thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img70.png)

#### Bước 4: Tạo Cognito Authorizer

Chọn **Authorizers** → **Create an authorizer** → đặt tên → chọn **Cognito** → điền User pool → **Token source** → **Create authorizer**.

![Hình 71](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img71.png)
![Hình 72](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img72.png)
![Hình 73 - Tạo Authorizer thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img73.png)

#### Bước 5: Gắn Authorizer vào các Method

Quay lại resource → **POST** → **Edit** → trong **Authorization** chọn `FightinggameCognitoAuthorizer` → **Save**. Thực hiện tương tự cho **GET /check**.

![Hình 74](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img74.png)
![Hình 75](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img75.png)
![Hình 76](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img76.png)
![Hình 77](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img77.png)

#### Bước 6: Bật CORS cho `/join` và `/check`

Tại `/join` chọn **Enable CORS** → tích **Default 4xx**, **5xx** và **POST** → **Save**. Thực hiện tương tự cho `/check`.

![Hình 78](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img78.png)
![Hình 79](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img79.png)
![Hình 80](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img80.png)
![Hình 81](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img81.png)
![Hình 82 - CORS thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img82.png)

#### Bước 7: Deploy API lên stage prod

Quay về root `/` → **Deploy** → chọn stage `prod` → **Deploy**.

![Hình 83](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img83.png)
![Hình 84](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img84.png)
![Hình 85 - Deploy thành công](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img85.png)

**Invoke URL:** `https://6whg1d5qca.execute-api.ap-southeast-1.amazonaws.com/prod`

