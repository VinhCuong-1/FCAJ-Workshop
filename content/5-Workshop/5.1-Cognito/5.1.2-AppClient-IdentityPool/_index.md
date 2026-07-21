---
title: "Configure App Client & Identity Pool"
date: 2026-05-04
weight: 2
chapter: false
pre: " <b> 5.1.2. </b> "
---

### Configure App Client & Identity Pool

**Objective:** Configure the App Client to enable the `ALLOW_USER_PASSWORD_AUTH` authentication method, then create an Identity Pool to exchange JWT for temporary IAM credentials for the client.

#### Step 1: View App Client ID

In **Applications**, click **App clients** to view the Client ID.

![Figure 12 - View App clients](/images/5-Workshop/5.1-Cognito/5.1.2/img12.png)

**Note:** Client ID: `73ipqvvo7h3u0j3elfqlj23jo3`

#### Step 2: Edit App Client

Select **FightingGame** to display the App client, then select **Edit**.

![Figure 13 - Edit FightingGame App client](/images/5-Workshop/5.1-Cognito/5.1.2/img13.png)

#### Step 3: Enable Authentication Flow

Check **Sign in with username and password: ALLOW_USER_PASSWORD_AUTH**.

![Figure 14 - Select ALLOW_USER_PASSWORD_AUTH](/images/5-Workshop/5.1-Cognito/5.1.2/img14.png)

Select **Save changes**.

![Figure 15 - Save changes](/images/5-Workshop/5.1-Cognito/5.1.2/img15.png)

#### Step 4: Create Identity Pool

Go back to the Cognito page and select **Identity pools**.

![Figure 17 - Select Identity pools](/images/5-Workshop/5.1-Cognito/5.1.2/img17.png)

Select **Create identity pools**.

![Figure 18 - Create identity pools](/images/5-Workshop/5.1-Cognito/5.1.2/img18.png)

#### Step 5: Configure Identity Pool

Check **Authenticated access**, check **Amazon Cognito user pool** and select **Next**.

![Figure 19 - Configure Authenticated access](/images/5-Workshop/5.1-Cognito/5.1.2/img19.png)

#### Step 6: Create IAM Role

At **Configure permissions** → **Create a new IAM Role**, enter IAM role name: `FightingGameAuthenticatedRole` and select **Next**.

![Figure 20 - Create IAM Role FightingGameAuthenticatedRole](/images/5-Workshop/5.1-Cognito/5.1.2/img20.png)

#### Step 7: Connect Identity Provider

Enter **User pool ID** and **App Client ID**, then select **Next**.

![Figure 21 - Enter User pool ID and App Client ID](/images/5-Workshop/5.1-Cognito/5.1.2/img21.png)

#### Step 8: Name and Finalize

Enter **Name**: `FightingGameIdentityPool` and select **Next**.

![Figure 22 - Name FightingGameIdentityPool](/images/5-Workshop/5.1-Cognito/5.1.2/img22.png)

Review your selections and select **Create identity pool**.

![Figure 23 - Review and Create identity pool](/images/5-Workshop/5.1-Cognito/5.1.2/img23.png)

#### Result

Identity Pool has been created successfully.

![Figure 24 - Identity Pool created successfully](/images/5-Workshop/5.1-Cognito/5.1.2/img24.png)

**Note:** Identity Pool ID: `ap-southeast-1:a5d743b9-e4a4-45d2-9cb1-9d214cee574c`

