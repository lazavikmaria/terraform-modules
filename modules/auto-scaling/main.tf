# #CREATING A NEW KEY PAIR AND EXPORTING OUR PUBLIC-KEY
# resource "aws_key_pair" "key-pair" {
#   key_name          = var.key-name
#   public_key        = var.public-key-file-name
# }


resource "aws_launch_configuration" "launch-configuration" {
  name                        = var.launch-configuration-name
  image_id                    = var.launch-configuration-ami-id
  instance_type               = var.launch-configuration-instance-type
  security_groups             = var.launch-configuration-security-groups
  user_data                   = var.user-data 
  # key_name                    = var.launch-configuration-public-key-name #Public keyname already attached in AWS Console
  root_block_device  {
    volume_type               = var.launch-configuration-root-block-device-volume-type
    volume_size               = var.launch-configuration-root-block-volume-size
  }
}


resource "aws_autoscaling_group" "autoscaling-group" {
  name                      = var.autoscaling-group-name
  launch_configuration      = aws_launch_configuration.launch-configuration.name
  max_size                  = var.max-size
  min_size                  = var.min-size
  health_check_grace_period = var.health-check-grace-period
  #Group-Size or desired capacity
  desired_capacity          = var.desired-capacity
  force_delete              = var.force-delete
  #A list of subnet IDs to launch resources in
  vpc_zone_identifier       = var.vpc-zone-identifier
  health_check_type         = var.health-check-type
  target_group_arns         = var.target-group-arns

  tag  {
    key = var.tag-key
    propagate_at_launch = true
    value = var.tag-value
  }
}
