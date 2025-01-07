Introduction:
This project is designed to manage AWS infrastructure using Terraform, leveraging Auto Scaling Groups (ASG) and Application Load Balancers (ALB) to dynamically handle server loads. Additionally, SNS and Lambda functions are integrated to perform actions before instance termination, ensuring a smooth and automated infrastructure management process.

Objective:
The objective of this project is to automate the scaling of server instances based on load conditions while ensuring pre-termination actions are executed to maintain application stability and performance.

Agenda:
Set up a robust infrastructure using Terraform. Implement auto-scaling for dynamic load handling. Ensure pre-termination tasks are executed using SNS and Lambda. Provide a structured and maintainable codebase for infrastructure management.

Use Cases:
Dynamic Load Management: Automatically scale instances based on traffic and load, ensuring optimal resource utilization.
Pre-Termination Tasks: Execute specific actions before terminating instances to maintain application consistency.
Automated Infrastructure: Use Terraform to automate the deployment and management of AWS resources.

Advantages:
Scalability: Automatically adjusts to traffic changes, ensuring high availability.
Automation: Reduces manual intervention through automated deployment and scaling.
Cost Efficiency: Optimizes resource usage, reducing unnecessary costs.
Maintainability: Structured Terraform codebase for easier maintenance and updates.

Project Structure
VPC Module
Purpose: Creates a Virtual Private Cloud (VPC) with two subnets, one public and one private, to segment and manage network traffic efficiently.
Configuration: Includes CIDR block allocation, DNS support, and tagging for identification and management.
Resources: AWS VPC and Subnet resources.

Security Groups Module
Purpose: Defines security groups to manage inbound and outbound traffic for the Application Load Balancer (ALB) and EC2 instances.
Configuration: Specifies rules for traffic filtering based on protocols, ports, and IP ranges.
Resources: Separate security groups for ALB and EC2.

EC2 Module
Purpose: Configures EC2 instances with specific instance profiles for role-based access.
Configuration: Defines instance types, AMI IDs, key pairs, and security group associations, along with IAM instance profiles.
Resources: AWS IAM Role, IAM Instance Profile, and EC2 Launch Template.

Target Groups Module
Purpose: Sets up target groups to manage and distribute traffic between instances based on load conditions.
Configuration: Defines target groups for day and night loads, with port and protocol specifications.
Resources: AWS LB Target Group resources.

ALB Module
Purpose: Configures the Application Load Balancer and its listeners to distribute traffic across target groups.
Configuration: Specifies load balancing algorithms, SSL policies, and listener rules for traffic distribution based on conditions.
Resources: AWS LB, LB Listener, and LB Listener Rule resources.

Auto Scaling Module
Purpose: Manages auto-scaling groups to handle dynamic scaling of instances based on load and predefined policies.
Configuration: Defines scaling policies, lifecycle hooks for pre-termination actions, and instance launch configurations.
Resources: AWS Auto Scaling Group, Lifecycle Hook, IAM Role, and IAM Policy.

SNS Module
Purpose: Creates SNS topics and subscriptions to send notifications for lifecycle events and trigger Lambda functions.
Configuration: Specifies SNS topic names, subscription endpoints, and notification protocols.
Resources: AWS SNS Topic and SNS Topic Subscription.

Lambda Function Module
Purpose: Defines Lambda functions to execute custom actions, such as running scripts before instance termination.
Configuration: Includes IAM roles and policies for Lambda execution and the function code itself.
Resources: AWS Lambda Function, IAM Role, and IAM Policy.

This Lambda function is part of an Auto Scaling Group's lifecycle hook setup. When an instance is about to be terminated, the function ensures that a specific script runs on the instance before it is terminated. The function achieves this by:
Extracting necessary information from the SNS message.
Running a custom script on the instance using AWS Systems Manager.
Completing the lifecycle action to allow the instance to terminate properly.
This process ensures that necessary cleanup or preparatory tasks are executed before the instance is terminated, maintaining the stability and integrity of the application.

Conclusion:
This project demonstrates a comprehensive approach to automating AWS infrastructure management using Terraform, ASG, ALB, SNS, and Lambda. By following the detailed documentation and structured codebase, you can achieve scalable, cost-efficient, and automated infrastructure that adapts to dynamic load conditions. If you have any further questions or need additional details, feel free to ask!

…







