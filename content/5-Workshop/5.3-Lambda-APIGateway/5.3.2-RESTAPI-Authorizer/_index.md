---
title: "Deploy REST API & Cognito Authorizer"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.3.2. </b> "
---

### Deploy REST API & Cognito Authorizer

**Objective:** Create a REST API with `/join` (POST) and `/check` (GET) resources, protected by a Cognito Authorizer, enable CORS, and deploy to the `prod` stage.

#### Step 1: Create API and Select REST API

In API Gateway, select **Create an API** → select **REST API** → fill in settings → **Create API**.

![Figure 54](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img54.png)
![Figure 57](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img57.png)
![Figure 58 - API created successfully](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img58.png)

#### Step 2: Create `/join` Resource and POST Method

Select **Create resource** → Resource name: `join` → Create **POST** method integrated with `FightingGameMatchmaker` Lambda.

![Figure 60](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img60.png)
![Figure 65 - Method created successfully](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img65.png)

#### Step 3: Create `/check` Resource and GET Method

Create another resource `/check`, same steps but select **GET**.

![Figure 70 - /check created successfully](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img70.png)

#### Step 4: Create Cognito Authorizer

Select **Authorizers** → **Create an authorizer** → name it → select **Cognito** → fill in User pool → **Token source** → **Create authorizer**.

![Figure 72](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img72.png)
![Figure 73 - Authorizer created successfully](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img73.png)

#### Step 5: Attach Authorizer to Methods

Go back to resource → **POST** → **Edit** → in **Authorization** select `FightinggameCognitoAuthorizer` → **Save**. Repeat for **GET /check**.

![Figure 75](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img75.png)
![Figure 76 - Authorizer attached](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img76.png)

#### Step 6: Enable CORS

At `/join` select **Enable CORS** → check **Default 4xx**, **5xx** and **POST** → **Save**. Repeat for `/check`.

![Figure 79](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img79.png)
![Figure 82 - CORS enabled](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img82.png)

#### Step 7: Deploy API

Go to root `/` → **Deploy** → select stage `prod` → **Deploy**.

![Figure 84](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img84.png)
![Figure 85 - Deploy successful](/images/5-Workshop/5.3-Lambda-APIGateway/5.3.2/img85.png)

**Invoke URL:** `https://6whg1d5qca.execute-api.ap-southeast-1.amazonaws.com/prod`

