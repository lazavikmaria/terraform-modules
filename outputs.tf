#### VPC outputs ######
output "vpc_id" {
  value = module.vpc.vpc_id
}
#OUTPUT OF PRIVATE SUBNET IDS
output "private-subnet-ids" {
  value = module.vpc.private-subnet-ids
}
#OUTPUT OF PUBLIC SUBNET IDS
output "public-subnet-ids" {
  value = module.vpc.public-subnet-ids
}
#OUTPUT EC2-SG
output "main-sg-security-group" {
  value = module.main-sg.main-sg-security-group
}
#TARGET GROUPS OUTPUT
output "target-group-arns" {
  value = module.alb-target-group.target-group-arns
}
#OUTPUT ALB
output "aws-alb" {
  value = module.app-alb.aws-alb
}
#LAUNCH CONFIGURATION AND AUTO-SCALING OUTPUT

output "launch-configuration" {
  value = module.ec2-instance.launch-configuration
}
output "autoscaling-group" {
  value = module.ec2-instance.autoscaling-group
}