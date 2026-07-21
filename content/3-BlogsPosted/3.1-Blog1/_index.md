---
title: "Blog 1"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---
# Automating Oracle Database@AWS Deployment with Terraform

Hello technology enthusiasts! Recently, the integration of major cloud platforms has been attracting a lot of attention from the engineering community. One of the most notable milestones is the Oracle Database@AWS (ODB@AWS) solution. In this article, I will share an overview of this system's architecture and how we can apply Infrastructure as Code (IaC) with Terraform to automate its deployment.

### 1. What is Oracle Database@AWS (ODB@AWS)?
In essence, ODB@AWS provides Oracle Exadata infrastructure managed directly by Oracle Cloud Infrastructure (OCI), but this hardware system is colocated right inside AWS data centers. This combination allows users to migrate Oracle databases to AWS while still taking advantage of the high performance and scalability of Exadata.

The brightest spot of this model is its deep integration with AWS native services. Oracle databases can now run side-by-side with applications deployed on Amazon EC2, Amazon ECS, or Amazon EKS. Thanks to the shortened physical distance, data flows are simplified, security is enhanced, and application development becomes faster. Currently, ODB@AWS supports two main database services: Oracle Autonomous AI Database on dedicated Exadata infrastructure (ADB-D) and Oracle Exadata Database Service on dedicated infrastructure (ExaDB-D).

### 2. Core Architecture of the Solution
To better visualize how these two cloud giants connect with each other, you can refer to the architecture diagram below:

![Oracle Database@AWS Architecture](/images/3-BlogsPosted/image_39402e.png)

Here is an analysis of the core components forming this architecture:

* **Amazon VPC and Subnet:** Amazon VPC allows you to launch AWS resources into a virtual network that you define. After creating the VPC, you can set up subnets (IP address ranges) to contain resources like EC2 servers in specific network zones.
* **OCI Virtual Cloud Network (VCN) and Subnet:** VCN is a customizable private internal network established within an OCI tenancy in an Oracle Region. The special feature of this multicloud model is that when you create an ODB network along with its subnets in AWS, a corresponding VCN along with its subnets is automatically created on the OCI Region side.

### 3. References
* **Original article link:** [Provision Oracle Database@AWS resources using Terraform](https://aws.amazon.com/vi/blogs/database/provision-oracle-databaseaws-resources-using-terraform/)