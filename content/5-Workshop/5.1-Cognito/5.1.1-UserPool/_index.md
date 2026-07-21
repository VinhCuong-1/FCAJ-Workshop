---
title: "Create Cognito User Pool"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 5.1.1. </b> "
---

### Create Cognito User Pool

**Objective:** Initialize a User Pool to manage player accounts, allowing registration and login with Username + Password, and issue JWT tokens for use in subsequent steps.

#### Step 1: Switch Region to Singapore

Make sure you are in the **ap-southeast-1 (Singapore)** region before starting.

![Figure 1 - Switch region to Singapore](/images/5-Workshop/5.1-Cognito/5.1.1/img1.png)

![Figure 2 - Now in Singapore region](/images/5-Workshop/5.1-Cognito/5.1.1/img2.png)

#### Step 2: Search and Open Cognito

In the Search box, search for **Cognito**.

![Figure 3 - Search for Cognito](/images/5-Workshop/5.1-Cognito/5.1.1/img3.png)

![Figure 4 - On the Amazon Cognito page](/images/5-Workshop/5.1-Cognito/5.1.1/img4.png)

#### Step 3: Start Creating User Pool

Select **"Get started for free in less than five minutes"**.

![Figure 5 - Select Get started](/images/5-Workshop/5.1-Cognito/5.1.1/img5.png)

![Figure 6 - Set up resources for your application page](/images/5-Workshop/5.1-Cognito/5.1.1/img6.png)

#### Step 4: Choose Application Type and Set Name

Select **"Single-page application (SPA)"** and name your application.

![Figure 7 - Select SPA and name the application](/images/5-Workshop/5.1-Cognito/5.1.1/img7.png)

#### Step 5: Configure Options

- Check **Username** and select **Enable Self-registration** to allow users to create accounts.
- Under **Required attributes for sign-up**, select **email** (Cognito requires email or phone number; email is more suitable for demo and password recovery).

![Figure 8 - Configure options](/images/5-Workshop/5.1-Cognito/5.1.1/img8.png)

#### Step 6: Remove https:// and Create User Directory

Remove `https://` (not needed yet) and select **Create user directory**.

![Figure 9 - Create User Directory](/images/5-Workshop/5.1-Cognito/5.1.1/img9.png)

#### Result

Successfully created 1 User Pool.

![Figure 10 - User Pool created successfully](/images/5-Workshop/5.1-Cognito/5.1.1/img10.png)

View User Pool information. Note the **User Pool ID** for use in subsequent steps.

![Figure 11 - User Pool ID: ap-southeast-1_phYoaMUPC](/images/5-Workshop/5.1-Cognito/5.1.1/img11.png)

**Note:** User Pool ID: `ap-southeast-1_phYoaMUPC`

