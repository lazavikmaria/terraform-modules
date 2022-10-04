#LAUNCH CONFIGURATION VARIABLES

# variable "key-name" {
#   default = ""
# }

# variable "public-key-file-name" {
#   default = ""
# }

variable "launch-configuration-region" {
  default = ""
}

variable "launch-configuration-name" {
  default = ""
}
variable "launch-configuration-security-groups" {
  type = list
}

variable "launch-configuration-ami-id" {
  default = ""
}

variable "launch-configuration-instance-type" {
  default = ""
}

variable "launch-configuration-public-key-name" {
  default = ""
}

variable "launch-configuration-root-block-device-volume-type" {
  default = ""
}

variable "launch-configuration-root-block-volume-size" {
  default = ""
}
variable "user-data" {
  default = ""
  
}

#AUTO-SCALING VARIABLES

variable "autoscaling-group-name" {
  default = ""
}

variable "max-size" {
  default = ""
}

variable "min-size" {
  default = ""
}

variable "health-check-grace-period" {
  default = ""
}

variable "desired-capacity" {
  default = ""
}

variable "force-delete" {
  default = ""
}

variable "vpc-zone-identifier" {
  type = list
}

variable "target-group-arns" {
  type = list
}

variable "health-check-type" {
  default = ""
}

variable "tag-key" {
  default = ""
}

variable "tag-value" {
  default = ""
}

#Application Load Balancer Target Group
variable "alb-tg-name" {
  default = ""
}
variable "target-group-port" {
  default = ""
}

variable "target-group-protocol" {
  default = ""
}

variable "vpc-id" {
  default = ""
}