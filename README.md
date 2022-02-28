# ghostapp
Nordcloud Assignment


[![Terraform](https://github.com/bhanuraina/ghostapp/actions/workflows/terraform.yml/badge.svg?branch=master&event=workflow_dispatch)](https://github.com/bhanuraina/ghostapp/actions/workflows/terraform.yml)

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

- Create ELB
- Create Launch COnfiguration for Autoscaling
- Create Autoscaling group
- Create VPC and subnets
- Create Key pair  

## Exclusions

- Create a S3 bucket to store remote state files. 
- Encrypt state files with KMS.
- Create a DynamoDB table for state locking

Reason: Local state is being used for demo purposes.

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

## Outputs

| Name | Description |
|------|-------------|
| <a name="elb_dns_name"></a> elb_dns_name | Ghost web url. | DNS details for the ELB created.|

### Procedure

The Terraform workflow is automated using GitHUb Workflow Actions in Hosted Runner for demo purposes(Selfhosted is recommened).

Update lastest secrets in github secrets:

| Secrets                                         |
|-------------------------------------------------|
|  <a name="secret1"></a> AWS_ACCESS_KEY_ID       |
|  <a name="secret2"></a> AWS_SECRET_ACCESS_KEY   |
|  <a name="secret3"></a> MYSQL_PASSWORD          |

![image](https://user-images.githubusercontent.com/26302748/155989637-eec9f215-2bd2-4f73-80b1-e92ce7b10eac.png)

![Uploading image.png…]()

The action run follwing workflow

* Terrform init.
* Terraform validate.
* Terraform vulernabilty scan. (Not Inculed , normally terrascan/Checkov etc)
* Terraform plan.
* Terraform apply.
 
