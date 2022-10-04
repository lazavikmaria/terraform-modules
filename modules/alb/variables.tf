

#ALB VARIABLES

variable "region" {
  default = ""
}

variable "alb-name" {
  default = ""
}

variable "internal" {
  default = ""
}

variable "alb-sg" {
  type = list
}

variable "alb-subnets" {
 type = list
}

variable "alb-tag" {
  default = ""
}

variable "target-group-arns" {
  default = ""
}
