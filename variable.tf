## this is for provider setting

variable "region" {
  default = "ap-south-1"
}
variable "user_access_key" {
  default = ""
}
variable "user_secret_key" {
  default = "F"
}
#
## this is for instance config

variable "ami" {
  default = "ami-03d3eec31be6ef6f9"
}

variable "instance_type" {
  default = "t2.micro"
}


/*
//for  elasticIP
variable "elasticIP_allocation_ID" {
  default = "eipalloc-060681535ba7a9b10"
}*/

##
# this is for vpc and subnet configure

variable "VPC_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr_block" {
  default = "10.0.1.0/24"
}
variable "subnet2_cidr_block" {
  default = "10.0.5.0/24"
}


