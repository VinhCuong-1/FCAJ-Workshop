---
title: "Blog 2"
date: 2026-05-04
weight: 1
chapter: false
pre: " <b> 3.2. </b> "
---
# Hybrid Cloud Architecture in Geological Analysis: Analyzing LITHOLENS™ Solution on AWS

In the mining industry, accurate geological data analysis is a prerequisite for optimizing mine design and development. Traditionally, the core logging process requires significant human labor, time, and is often conducted in remote areas. To address these limitations, ALS GeoAnalytics developed LITHOLENS™—a platform applying Machine Learning (ML) and Computer Vision to automate drill core analysis.

However, operating large-scale Deep Learning models presents a significant technical challenge: workloads are typically highly volatile. Maintaining GPU server clusters 24/7 to wait for data processing results in massive resource waste and operational costs. To solve this problem, ALS GeoAnalytics adopted a hybrid cloud architecture on AWS, clearly separating the API communication layer from the compute processing layer.

Below is the architecture diagram of the LITHOLENS™ system:

![LITHOLENS™ Architecture on AWS](/images/3-BlogsPosted/image_litholens.png)

### 1. API Layer: Optimization with Serverless Architecture
All incoming requests from client systems (submitting jobs, checking status, extracting results) are handled through a unified communication gateway.

* **Amazon API Gateway and AWS Lambda:** Instead of using traditional API servers that are always active, the system utilizes Amazon API Gateway combined with AWS Lambda. This serverless model allows the system to only charge when actual requests occur. During traffic spikes, AWS Lambda automatically scales up processing; conversely, when there are no active tasks, the operational costs of this layer are minimized. Lambda also acts as an orchestrator, receiving parameters and configuring the corresponding compute resources.

### 2. Compute and Processing Layer: Intensive AI Processing
This layer is the core for running resource-intensive Deep Learning tasks, using internal models like RoQE Net or VeinNet.

* **Amazon EKS (Elastic Kubernetes Service):** The compute layer runs on Amazon EKS using powerful GPU-equipped G6 instances. The key design aspect is the ability to auto-scale based on the length of the job queue.
* **Scale-to-Zero:** When there are no jobs waiting in the queue, the EKS cluster is configured to scale down to zero. This ensures that expensive compute resources are only used and billed during active task execution.
* **Custom AMI (Amazon Machine Image):** To overcome startup latency when launching containers with complex ML libraries, the system uses pre-configured AMIs. Model artifacts and dependencies are built directly into the AMI, reducing container startup time to under 30 seconds, thereby increasing throughput and minimizing idle time.

### 3. Storage Layer: Ensuring Data Integrity and Independence
Decoupling the storage layer from the compute layer allows Amazon EKS pods to remain stateless, ensuring data safety when the system scales up or down.

* **Amazon S3:** Used as the primary object storage for input files (drill core images) and intermediate calculation results.
* **Amazon RDS (Relational Database Service):** Manages and stores structured data, including job details and geological metadata.
* **Amazon CloudWatch:** Integrated for system monitoring, logging workflows, and providing real-time performance metrics.

### Conclusion
The architecture of LITHOLENS™ is an excellent demonstration of the decoupling design principle in modern software architecture. By combining the flexibility and cost-effectiveness of serverless architecture (AWS Lambda) with the highly scalable computing power of containers (Amazon EKS), enterprises can operate compute-heavy AI systems sustainably. This approach not only meets the demanding performance requirements of Computer Vision processing but also solves the problem of cloud cost optimization at scale.

### References
* **Original article link:** [How ALS GeoAnalytics' LITHOLENS revolutionizes core logging through machine learning with Amazon EKS](https://aws.amazon.com/vi/blogs/architecture/how-als-geoanalytics-litholens-revolutionizes-core-logging-through-machine-learning-with-amazon-eks/)