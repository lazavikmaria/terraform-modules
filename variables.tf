#GLOBAL
variable "aws_region" {
  default = "us-east-1"
}
variable "aws_access_key" {
  default = ""
}
variable "aws_secret_key" {
  default = ""
}

#VPC
variable "instance-tenancy" {
  default = "default"
}
variable "enable-dns-support" {
  default = "true"
}
variable "enable-dns-hostnames" {
  default = "true"
}
variable "vpc-name" {
  default = "webserver-vpc"
}
variable "internet-gateway-name" {
  default = "webserver-igw"
}

#PUBLIC-SUBNET TAGS
variable "map_public_ip_on_launch" {
  default = "true"
}
variable "public-subnets-name" {
  default = "web-public-subnets"
}
variable "public-subnet-routes-name" {
  default = "web-public-subnet-routes"
}

#NAT-GATEWAYS REQUIRED
variable "total-nat-gateway-required" {
  default = "1"
}
#EIP TAGS
variable "eip-for-nat-gateway-name" {
  default = "web-eip-nat"
}
#NAT-GATEWAY TAGS
variable "nat-gateway-name" {
  default = "web-nat-gateway"
}
#PRIVATE ROUTES CIDR
variable "private-route-cidr" {
  default = "0.0.0.0/0"
}
#PRIVATE ROUTE TAGS
variable "private-route-name" {
  default = "web-private-route"
}
#VPC CIDR BLOCK
variable "vpc-cidr" {
  default = "10.11.0.0/16"
}
#VPC PUBLIC SUBNETS CIDR BLOCK LIST
variable "vpc-public-subnet-cidr" {
  default = [
    "10.11.1.0/24",
  "10.11.2.0/24", ]
}
#VPC PRIVATE SUBNETS CIDR BLOCK LIST
variable "vpc-private-subnet-cidr" {
  default = [
    "10.11.4.0/24",
  "10.11.5.0/24", ]
}
variable "private-subnet-name" {
  default = "web-private-subnet"
}
#FETCH AZS FROM REGION
data "aws_availability_zones" "azs" {}



 #LAUNCH CONFIGURATION VARIABLES

variable "launch-configuration-name" {
  default = "ec2-instance"
}

variable "launch-configuration-security-groups" {
  default = ""
}

variable "launch-configuration-ami-id" {
  default = "ami-0cff7528ff583bf9a"
}

variable "launch-configuration-instance-type" {
  default = "t3.micro"
}

variable "launch-configuration-root-block-device-volume-type" {
  default = "gp2"
}

variable "launch-configuration-root-block-volume-size" {
  default = "30"
}

variable "user-data" {
  default = ""
}

# #AUTO-SCALING VARIABLES

variable "autoscaling-group-name" {
  default = "webserver-asg"
}

variable "max-size" {
  default = "2"
}

variable "min-size" {
  default = "1"
}

variable "health-check-grace-period" {
  default = "300"
}

variable "desired-capacity" {
  default = "2"
}

variable "force-delete" {
  default = "true"
}

variable "vpc-zone-identifier" {
  default = ""
}

variable "target-group-arns" {
  default = ""
}

variable "health-check-type" {
  default = "ELB"
}

variable "tag-key" {
  default = "Name"
}

variable "tag-value" {
  default = "ec2-instance"
}


# MAIN-SG vars

variable "vpc_id" {
  default = ""
}
variable "sg-name" {
  default = "main"
}

#SG INBOUND RULES#
variable "ingress_allows" {
  description = "using ports 80,443,22 to open inbound rules"
  default     = ["80", "443", "22"]
}

variable "protocol" {
  default = "tcp"
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

#SG OUTBOUND RULES#
variable "outbound-rule-from-port" {
  default = "0"
}

variable "outbound-rule-to-port" {
  default = "0"
}

variable "outbound-rule-protocol" {
  default = "-1"
}

#Application Load Balancer Target Group
# ALB-TARGET-GROUP vars

variable "alb-tg-name" {
  default = "web"
}
variable "target-group-port" {
  default = "80"
}

variable "target-group-protocol" {
  default = "HTTP"
}

variable "vpc-id" {
  default = ""
}

# APP LOAD BALANSER vars

variable "alb-name" {
  default = "web"
}

variable "internal" {
  default = "false"
}

variable "alb-sg" {
  default = ""
}

variable "alb-subnets" {
  default = ""
}

variable "alb-tag" {
  default = "app-alb"
}

variable "target-group-arn" {
  default = ""
}


