# Terraform-project-iti

This Terraform project creates an AWS infrastructure that uses a Virtual Private Cloud (VPC) to host proxy servers in public subnets and Apache servers in private subnets. It spans two availability zones (AZs) to ensure high availability and scalability. The Elastic Load Balancer (ELB) manages traffic, while Terraform state locking is achieved via an S3 bucket, ensuring consistent provisioning across the team.

![download](https://github.com/user-attachments/assets/8ab1b0a8-b204-41f0-a7f8-79579030af91)
![Animation](https://github.com/user-attachments/assets/76e9297b-68b7-415c-8a76-236bd2d1ebc9)

### **Architecture Components:**

1. **VPC (Virtual Private Cloud)**:
   - **CIDR Block**: `10.0.0.0/16`
   - Purpose: Creates an isolated environment to manage resources within AWS.

2. **Subnets**:
   - **Public Subnets** (`10.0.0.0/24`, `10.0.2.0/24`):
     - Hosts proxy servers, which serve as intermediaries between users and the backend services.
   - **Private Subnets** (`10.0.1.0/24`, `10.0.3.0/24`):
     - Houses the Apache web servers that handle the actual web traffic.

3. **Elastic Load Balancer (ELB)**:
   - Balances incoming web traffic across proxy servers in different AZs for high availability.
   - Monitors proxy server health and reroutes traffic if needed.

4. **EC2 Instances**:
   - **Proxy Servers**: Deployed in public subnets to forward traffic to the private Apache servers.
   - **Apache Servers**: Deployed in private subnets, providing backend services for incoming traffic from the proxy servers.

5. **Internet Gateway (IGW)**:
   - Enables public subnets to access the internet for outbound traffic, facilitating communication between users and proxy servers.

6. **Route Tables**:
   - **Public Route Table**: Directs traffic from the public subnets to the Internet Gateway.
   - **Private Route Table**: Routes internal traffic between subnets without exposing backend servers to the internet.

7. **Security Groups**:
   - **Proxy Security Group**: Allows HTTP/HTTPS access from the internet and traffic to the Apache servers.
   - **Apache Security Group**: Only permits traffic from the proxy servers to ensure security.

8. **S3 Bucket**:
   - Used for storing Terraform state files and state locking, preventing conflicts when multiple users modify the infrastructure.

### **Key Features**:
- **High Availability**: Resources are deployed across multiple availability zones, ensuring uptime even in case of failure in one AZ.
- **Security**: The use of private subnets and security groups ensures that Apache servers are not exposed directly to the internet.
- **Scalability**: The architecture supports horizontal scaling of both proxy and Apache servers, as needed.

### **Project Structure**:
- `main.tf`: Contains the definition of all the AWS resources such as VPC, subnets, EC2 instances, and security groups.
- `variables.tf`: Holds customizable variables like CIDR blocks, region, instance types, etc.
- `outputs.tf`: Displays key outputs like the DNS name of the load balancer and the VPC ID.
- `backend.tf`: Specifies backend configuration for state storage in an S3 bucket.

### **Setup Instructions**:

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd terraform-project-iti
   ```

2. **Configure Variables**:
   Modify `variables.tf` to set the desired AWS region, CIDR blocks, and instance configurations.

3. **Initialize Terraform**:
   Initialize the project to download required provider plugins.
   ```bash
   terraform init
   ```

4. **Plan Infrastructure**:
   Generate a plan to ensure the configuration is correct.
   ```bash
   terraform plan
   ```

5. **Deploy the Infrastructure**:
   Apply the Terraform configuration to provision the resources.
   ```bash
   terraform apply
   ```

6. **Clean Up Resources** (Optional):
   To destroy the resources when you no longer need them:
   ```bash
   terraform destroy
   ```

### **Usage**:
Once deployed, the Elastic Load Balancer will route traffic to the proxy servers, which forward requests to the Apache servers. The Apache servers handle web traffic and return the necessary content to users.

### **Contributing**:
Please feel free to open issues or submit pull requests for new features or improvements.

### Pictures from the project
### check loadbalancer
![AWS](https://github.com/user-attachments/assets/4697385b-2403-423f-ae8b-a38de832f8d5)

### 1
![10](https://github.com/user-attachments/assets/f0b1ba41-bb4d-4926-84bd-ee07e1ce67ce)

### 2
![20](https://github.com/user-attachments/assets/7f37cd1a-7d79-4fa9-b8d3-9dbd6d1fb2c8)

### 3
![30](https://github.com/user-attachments/assets/26defb7e-0397-4b23-80d3-659fd42349ab)

### 4
![40](https://github.com/user-attachments/assets/3202937d-7009-45cc-96db-53ed88e57537)

### 5
![50](https://github.com/user-attachments/assets/090cf712-f2e1-4163-8586-dab9faa9f27b)


