variable "vpc_id" {
    type = string
    description = "The ID of the Virtual Private Cloud (VPC) where the ECS Cluster will be launched."
}

variable "subnet_id" {
    type = string
    description = "The VPC Subnet ID's to launch in"
}

variable "create_ecs_cluster" {
    type        = bool
    description = "Indicates whether to create an ECS (Elastic Container Service) cluster."
}

variable "aws_ecs_cluster_name" {
    type        = string
    description = "Name of the ECS cluster."
}

variable "create_ecs_service" {
    type        = bool
    description = "Indicates whether to create an ECS service."
}

variable "aws_ecs_service_name" {
    type        = string
    description = "Name of the ECS service."
}

variable "task_definition_name" {
    type        = string
    description = "Name of the ECS task definition."
}

variable "desired_count" {
    type        = number
    description = "The desired number of tasks to run in the ECS service."
}

variable "ecs_service_launch_type" {
    type        = string
    description = "The launch type for the ECS service (e.g., EC2 or Fargate)."
}

variable "assign_public_ip" {
    type        = bool
    description = "Indicates whether to assign a public IP to tasks."
}

variable "enable_service_discovery" {
    type        = bool
    description = "Indicates whether to enable service discovery for the ECS service."
}

variable "container_name" {
    type        = string
    description = "Name of the container."
}

variable "ecs_requires_compatibilities" {
    type        = string
    description = "The compatibility requirement for the ECS task definition."
}

variable "network_mode" {
    type        = string
    description = "The network mode for the ECS task."
}

variable "task_def_cpu" {
    type        = string
    description = "The CPU units for the ECS task definition."
}

variable "task_def_memory" {
    type        = string
    description = "The memory for the ECS task definition."
}

variable "container_definitions_path" {
    type        = string
    description = "The path to the container definitions file."
}

## security group

variable "ecs_security_group_name" {
    type        = string
    description = "The name of the ECS security group."
}

variable "ecs_ingress_rules" {
    type        = list(string)
    description = "The ingress rules for the ECS security group."
}

variable "ecs_ingress_cidr_blocks" {
    type        = list(string)
    description = "The CIDR blocks for the ingress rules."
}

variable "ecs_ingress_rules_from_port" {
    type        = list(number)
    description = "The start port for the ingress rules."
}

variable "ecs_ingress_rules_to_port" {
    type        = list(number)
    description = "The end port for the ingress rules."
}

variable "ecs_ingress_rules_protocols" {
    type        = list(string)
    description = "The protocols for the ingress rules."
}

variable "ecs_egress_rules" {
    type        = list(string)
    description = "The egress rules for the ECS security group."
}

variable "ecs_egress_cidr_blocks" {
    type        = list(string)
    description = "The CIDR blocks for the egress rules."
}

variable "ecs_egress_rules_from_port" {
    type        = list(number)
    description = "The start port for the egress rules."
}

variable "ecs_egress_rules_to_port" {
    type        = list(number)
    description = "The end port for the egress rules."
}

variable "ecs_egress_rules_protocols" {
    type        = list(string)
    description = "The protocols for the egress rules."
}
