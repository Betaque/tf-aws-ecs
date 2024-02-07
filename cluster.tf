resource "aws_ecs_cluster" "ecs_cluster" {
  count = var.create_ecs_cluster ? 1 : 0
  name = var.aws_ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

