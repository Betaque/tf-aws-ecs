# ECS Module

This module creates a Amazon Elastic Container Service (ECS) in AWS with customizable configurations.

1. **Get Started:** Begin by creating the necessary files, provider.tf and main.tf, in your Terraform project directory.
2. **Declare Provider:** Open provider.tf and declare the AWS provider. Ensure you've configured your AWS credentials and set the desired region.
```
provider "aws" {
  region = "us-east-1" // Set your AWS region
}
```
3. **Add ECS Module and Define Variables:** Incorporate the ECS Module into your main.tf file, and set values for the variables defined in variables.tf.
For Example:-
```
module "ecs" {
  source                      = "git::https://github.com/Betaque/tf-aws-ecs.git//?ref=feat/generic-ecs" # Path of the Module
  ## cluster variables
  create_ecs_cluster          = true  # Set to "true" if you want to create a cluster, otherwise set to "false"
  ecs_cluster_name            = "<cluster name>" 

  ## Service variables
  create_ecs_service          = true  # Set to "true" if you want to create a service, otherwise set to "false"
  enable_service_discovery    = true  # Set to "true" if you want to enable service discovery, otherwise set to "false"
  ecs_service_name            = "test-service"
  desired_count               = 1
  assign_public_ip            = false  # Set to "true" if you want assign public ip, otherwise set to "false"
  ecs_service_launch_type     = "EC2"   # The valid values are EC2, FARGATE, and EXTERNAL. Defaults to EC2.

  ## Task Definition variables
  task_definition_name        = "test-task-def"
  ecs_requires_compatibilities= "FARGATE" # The valid values are EC2 and FARGATE.
  network_mode                = "awsvpc"
  task_def_cpu                = 256
  task_def_memory             = 512
  container_definitions_path  = templatefile("task-def/test.json", {
    ecs_service_name            = "test-service"
  })

  ## Security Group variables
  vpc_id                      = ""
  ecs_subnet_id               = ""
  ecs_security_group_name     = ""
  # ingress rule 
  ecs_ingress_rules           = [80, 22]        # port numbers
  ecs_ingress_cidr_blocks     = ["0.0.0.0/0"]
  ecs_ingress_rules_from_port = [80, 22]        # port range form
  ecs_ingress_rules_to_port   = [80, 22]        # port range to
  ecs_ingress_rules_protocols = ["tcp", "tcp"]

  # egress rule
  ecs_egress_rules            = [0]             # all port
  ecs_egress_cidr_blocks      = ["0.0.0.0/0"] 
  ecs_egress_rules_from_port  = [0]             # all
  ecs_egress_rules_to_port    = [0]             # all
  ecs_egress_rules_protocols  = ["-1"]          # all protocol
}
