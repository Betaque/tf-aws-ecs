resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = var.task_definition_name
  requires_compatibilities = [var.ecs_requires_compatibilities]
  network_mode             = var.network_mode
  cpu                      = var.task_def_cpu
  memory                   = var.task_def_memory
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  container_definitions    = var.container_definitions_path
  lifecycle {
    ignore_changes = [
      task_role_arn,
      tags_all,
      skip_destroy
    ]
  }
}
