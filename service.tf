resource "aws_ecs_service" "ecs_service_name" {
  count = var.create_ecs_service ? 1 : 0
  name             = var.aws_ecs_service_name
  cluster          = var.aws_ecs_cluster_name
  task_definition  = "${var.task_definition_name}:${aws_ecs_task_definition.ecs_task_definition.revision}"
  desired_count    = var.desired_count
  launch_type      = var.ecs_service_launch_type
  network_configuration {
    subnets          = [var.public_subnet_id]
    security_groups  = [aws_security_group.ecs_security_group.id]
    assign_public_ip = var.assign_public_ip
  }
  lifecycle {
    ignore_changes = [
      timeouts,
      load_balancer,
    ]
  }

  dynamic "service_registries" {
    for_each = var.enable_service_discovery ? [1] : []
    content {
      registry_arn   = aws_service_discovery_service.ecs_service_discovery[0].arn
      container_name = var.container_name
    }
  }
}
