module "vpc" {
  source = "./modules/vpc"

  instance-tenancy           = var.instance-tenancy
  enable-dns-support         = var.enable-dns-support
  enable-dns-hostnames       = var.enable-dns-hostnames
  vpc-name                   = var.vpc-name
  internet-gateway-name      = var.internet-gateway-name
  map_public_ip_on_launch    = var.map_public_ip_on_launch
  public-subnets-name        = var.public-subnets-name
  public-subnet-routes-name  = var.public-subnet-routes-name
  private-subnet-name        = var.private-subnet-name
  total-nat-gateway-required = var.total-nat-gateway-required
  eip-for-nat-gateway-name   = var.eip-for-nat-gateway-name
  nat-gateway-name           = var.nat-gateway-name
  private-route-cidr         = var.private-route-cidr
  private-route-name         = var.private-route-name
  vpc-cidr                   = var.vpc-cidr
  vpc-public-subnet-cidr     = var.vpc-public-subnet-cidr
  vpc-private-subnet-cidr    = var.vpc-private-subnet-cidr
}


module "main-sg" {
  source = "./modules/main-sg"

  vpc_id                    = module.vpc.vpc_id
  sg-name                   = var.sg-name
  ingress_allows            = var.ingress_allows
  protocol                  = var.protocol
  cidr_blocks               = var.cidr_blocks
  outbound-rule-from-port   = var.outbound-rule-from-port
  outbound-rule-to-port     = var.outbound-rule-to-port
  outbound-rule-protocol    = var.outbound-rule-protocol
}


module "alb-target-group" {
  source = "./modules/alb-target-group"

  #Application Load Balancer Target Group
  alb-tg-name               = var.alb-tg-name
  target-group-port         = var.target-group-port
  target-group-protocol     = var.target-group-protocol
  vpc-id                    = module.vpc.vpc_id
}


module "app-alb" {
  source = "./modules/alb"

  alb-name                  = var.alb-name
  internal                  = var.internal
  alb-sg                    = [module.main-sg.main-sg-security-group]
  alb-subnets               = module.vpc.public-subnet-ids
  alb-tag                   = var.alb-tag
  target-group-arns          = module.alb-target-group.target-group-arns
}


module "ec2-instance" {
  source     = "./modules/auto-scaling"
  depends_on = [module.vpc, module.main-sg, module.alb-target-group, module.app-alb]

  #Launch Configuration

  launch-configuration-name                          = var.launch-configuration-name
  launch-configuration-ami-id                        = var.launch-configuration-ami-id
  launch-configuration-security-groups               = [module.main-sg.main-sg-security-group]
  launch-configuration-instance-type                 = var.launch-configuration-instance-type
  launch-configuration-root-block-device-volume-type = var.launch-configuration-root-block-device-volume-type
  launch-configuration-root-block-volume-size        = var.launch-configuration-root-block-volume-size
  user-data                                          = file("./modules/auto-scaling/scripts/user-data.sh")

  #Auto-Scaling

  autoscaling-group-name                            = var.autoscaling-group-name
  max-size                                          = var.max-size
  min-size                                          = var.min-size
  health-check-grace-period                         = var.health-check-grace-period
  desired-capacity                                  = var.desired-capacity
  force-delete                                      = var.force-delete
  #A list of subnet IDs to launch resources in
  vpc-zone-identifier                               = module.vpc.public-subnet-ids
  target-group-arns                                 = [module.alb-target-group.target-group-arns]
  health-check-type                                 = var.health-check-type
  tag-key                                           = var.tag-key
  tag-value                                         = var.tag-value
}