#LAUNCH CONFIGURATION AND AUTO-SCALING OUTPUT

output "launch-configuration" {
  value = aws_launch_configuration.launch-configuration.name
}

output "autoscaling-group" {
  value = aws_autoscaling_group.autoscaling-group.name
}
