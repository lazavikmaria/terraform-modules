#TARGET GROUPS OUTPUT

output "target-group-arns" {
  value = aws_lb_target_group.alb-tg.arn
}