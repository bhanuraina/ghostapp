# ghostapp
Nordcloud Assignment

#### High Level Network Achitecture

![image](https://user-images.githubusercontent.com/26302748/155410974-884c8907-803f-41c3-9f1c-78ca631123f3.png)

#### Landscape

![image](https://user-images.githubusercontent.com/26302748/155727391-0ab5b436-fb73-4bb8-a57d-7af4bd4d724b.png)


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

## Features

- Create a S3 bucket to store remote state files. 
- Encrypt state files with KMS.
- Create a DynamoDB table for state locking.
- Create ELB
- Create Launch COnfiguration for Autoscaling
- Create Autoscaling group
- Create VPC and subnets
- Create Key pair  

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.2.0 |
| <a name="provider_aws.replica"></a> [aws.replica](#provider\_aws.replica) | >= 4.2.0 |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="website_url"></a> website_url | Ghost web url. | `string` | no |
| <a name="website_admin_url"></a>website_admin_url| Ghost web Admin url. | `string` | no |
| <a name="mysql_password"></a> mysql_password | RDS Master password. | `string` | yes |
| <a name="mysql_username"></a>mysql_username| RDS Master username. | `string` | yes |

## Inputs

| Name | Description |
|------|-------------|
| <a name="elb_dns_name"></a> elb_dns_name | Ghost web url. | DNS details for the ELB created.|

### Procedure

The Terraform workflow is automated using GitHUb Workflow Actions

The action run follwing workflow

* Terrform init.
* Terraform validate.
* Terraform vulernabilty scan. 
* Terraform plan.
* Terraform apply.
 
