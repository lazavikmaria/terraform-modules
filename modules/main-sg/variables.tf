variable "vpc_id" {
  default = ""
}

variable "sg-name" {
  default = ""
}

#SG INBOUND RULES#
variable "ingress_allows" {
  description = "using ports 80,443,22 to open inbound rules"
 type = list
}
variable "protocol" {
  default = ""
}
variable "cidr_blocks" {
  type = list
}
#SG OUTBOUND RULES#
variable "outbound-rule-from-port" {
  default = ""
}
variable "outbound-rule-protocol" {
  default = ""
}
variable "outbound-rule-to-port" {
  default = ""
}