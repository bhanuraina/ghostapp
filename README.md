# ghostapp
Nordcloud Assignment

#### High Level Network Achitecture

![image](https://user-images.githubusercontent.com/26302748/155410974-884c8907-803f-41c3-9f1c-78ca631123f3.png)

## Summary:

The Ghost app is hosted on Ec2 instances within autoscaling launch configuration in subnets in VPC.
Subnets span across multiple availibity zones for High availablity.

### Traffic flow :

Request lands on DNS for the Elastic Load Balancer and routed to listeners as Ec2 instances.

The Ghost is installed on Ec2 while creation with help of userdata scripts.

Nginx proxy re route the traffic to ghost application.

### Prerequisites:

* Terrform
* AWS Cli
* NPM
* Ghost
* NodeJs
* Git

### Procedure

The Terraform workflow is automated using GitHUb Workflow Actions

The action run follwing workflow

* Terrform init.
* Terraform validate.
* Terraform vulernabilty scan. 
* Terraform plan.
* Terraform apply.
 
