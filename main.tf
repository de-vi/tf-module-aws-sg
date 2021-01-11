resource "aws_security_group" "sg" {
  count       = var.security_group_id == "" ? 1 : 0
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
}

locals {
  security_group_id = var.security_group_id == "" ? join("", aws_security_group.sg.*.id) : var.security_group_id
}

resource "aws_security_group_rule" "ingress_sg_rules" {
  count = length(var.ingress_security_group_rules)

  security_group_id        = local.security_group_id
  type                     = "ingress"
  description              = lookup(var.ingress_security_group_rules[count.index], "desc")
  from_port                = lookup(var.ingress_security_group_rules[count.index], "from_port")
  to_port                  = lookup(var.ingress_security_group_rules[count.index], "to_port")
  protocol                 = lookup(var.ingress_security_group_rules[count.index], "protocol")
  source_security_group_id = lookup(var.ingress_security_group_rules[count.index], "source_security_group_id")
}

resource "aws_security_group_rule" "ingress_cidr_rules" {
  count = length(var.ingress_cidr_rules)

  security_group_id = local.security_group_id
  type              = "ingress"
  description       = lookup(var.ingress_cidr_rules[count.index], "desc")
  from_port         = lookup(var.ingress_cidr_rules[count.index], "from_port")
  to_port           = lookup(var.ingress_cidr_rules[count.index], "to_port")
  protocol          = lookup(var.ingress_cidr_rules[count.index], "protocol")
  cidr_blocks       = split(",", lookup(var.ingress_cidr_rules[count.index], "cidr_blocks"))
}

resource "aws_security_group_rule" "egress_cidr_rules" {
  count = length(var.egress_cidr_rules)

  security_group_id = local.security_group_id
  type              = "egress"
  description       = lookup(var.egress_cidr_rules[count.index], "desc")
  from_port         = lookup(var.egress_cidr_rules[count.index], "from_port")
  to_port           = lookup(var.egress_cidr_rules[count.index], "to_port")
  protocol          = lookup(var.egress_cidr_rules[count.index], "protocol")
  cidr_blocks       = split(",", lookup(var.egress_cidr_rules[count.index], "cidr_blocks"))
}