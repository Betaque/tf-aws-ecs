# ECS Module

This module creates a Amazon Elastic Container Service (ECS) in AWS with customizable configurations.

### Prerequisites
- An AWS account.
- Terraform CLI installed on your local machine, you can check it, [How to Install Guideline here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### AWS Authentication 
This guide outlines the process of authenticating with AWS using Terraform through Access Key and Secret Key.

**Generate Access Key and Secret Key:**
1. Log in to your AWS Management Console.
2. Go to the IAM service.
3. Navigate to the Users section and select the user for whom you want to generate the access key and secret key.
4. Under the Security credentials tab, click on Create access key.
5. Make sure to save the access key ID and secret access key. These will be used for authentication.

### Module Configurations:
 
**1. Create a new Terraform configuration file (e.g., provider.tf) or use an existing one.**

**2. Add the following code to configure AWS provider with access key and secret key:**

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"  # Replace with your desired AWS region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```
Replace **YOUR_ACCESS_KEY** and **YOUR_SECRET_KEY** with the access key ID and secret access key generated in the previous step.

or you can export your access_key and secret_key on your local machine.
```
export access_key="YOUR_ACCESS_KEY"
export secret_key="YOUR_SECRET_KEY"
```

**3. Add ECS Module and Define Variables:**


Add the ECS Module to your main.tf file and fill in the variables in variables.tf with the values you need. Just replace the example values with your own settings.

**For Example:-**

```
module "ecs" {
  source                           = "git::https://github.com/Betaque/tf-aws-ecs.git//?ref=feat/generic-ecs" # Path of the Module
  create_ecs_cluster               = true
  aws_ecs_cluster_name             = "dev-cluster"
  create_ecs_service               = true
  enable_service_discovery         = true
  aws_ecs_service_name             = "test-service"
  desired_count                    = 1
  assign_public_ip                 = false
  ecs_service_launch_type          = "FARGATE"
  container_name                   = "test"
  
  ## Task defination variables
  task_definition_name             = "test"
  ecs_requires_compatibilities     = "FARGATE"
  network_mode                     = "awsvpc"
  task_def_cpu                     = 256
  task_def_memory                  = 512
  container_definitions_path       = templatefile("test.json", {
    ecs_service_name               = "test-service" #given parameters which used in json file  
  })
  ## Security Group variables
  vpc_id                           = <YOUR_VPC_ID>
  subnet_id                        = <YOUR_SUBNET_ID>
  ecs_security_group_name          = "sg"
  ecs_ingress_rules                = [80, 22]
  ecs_ingress_cidr_blocks          = ["0.0.0.0/0"]
  ecs_ingress_rules_from_port      = [80, 22]
  ecs_ingress_rules_to_port        = [80, 22]
  ecs_ingress_rules_protocols      = ["tcp", "tcp"]
  ecs_egress_rules                 = [0]
  ecs_egress_cidr_blocks           = ["0.0.0.0/0"]
  ecs_egress_rules_from_port       = [0]
  ecs_egress_rules_to_port         = [0]
  ecs_egress_rules_protocols       = ["-1"]
}
```

**4. Initialize Terraform:** 

Open a terminal and navigate to the directory containing your Terraform configuration file.

Run the following command to initialize Terraform:
```
terraform init
```

**5. Apply Terraform Configuration:** 

After initializing, you can now apply the Terraform configuration to authenticate with AWS:
```
terraform apply
``` 
