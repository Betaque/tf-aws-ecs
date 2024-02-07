resource "aws_security_group" "ecs_security_group" {
  name   = var.ecs_security_group_name
  vpc_id = var.vpc_id 

  tags = {
    Name = var.ecs_security_group_name
  }
}

resource "aws_security_group_rule" "ecs_ingress_rules" {
  count = length(var.ecs_ingress_rules)
  type              = "ingress"
  security_group_id = aws_security_group.ecs_security_group.id
  cidr_blocks = var.ecs_ingress_cidr_blocks
  from_port   = var.ecs_ingress_rules_from_port[count.index]
  to_port     = var.ecs_ingress_rules_to_port[count.index]
  protocol    = var.ecs_ingress_rules_protocols[count.index]
}

resource "aws_security_group_rule" "ecs_egress_rules" {
  count = length(var.ecs_egress_rules)
  type              = "egress"
  security_group_id = aws_security_group.ecs_security_group.id
  cidr_blocks = var.ecs_egress_cidr_blocks
  from_port   = var.ecs_egress_rules_from_port[count.index]
  to_port     = var.ecs_egress_rules_to_port[count.index]
  protocol    = var.ecs_egress_rules_protocols[count.index]
}