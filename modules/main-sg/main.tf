resource "aws_security_group" "main-sg" {
  name                 = var.sg-name
  vpc_id               = var.vpc_id

  tags  = {
    Name = var.sg-name
  }
  
   dynamic "ingress" {
    for_each = var.ingress_allows
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
  }
  egress {
    from_port         = var.outbound-rule-from-port
    protocol          = var.outbound-rule-protocol
    to_port           = var.outbound-rule-to-port
    cidr_blocks       = var.cidr_blocks
  }
}
