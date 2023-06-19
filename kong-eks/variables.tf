variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "kong-demo"
  type    = string
}

variable "vpc_cidr_block" {
  default = "172.91.0.0/16"
  type    = string
}

variable "disk_size" {
  default = "20"
  type    = string
}

variable "instance_types" {
  default = "t3.medium"
  type    = string
}

variable "no_of_public_subnet" {
  default = "2"
}

variable "redpanda_namespace" {
  default = "default"
}
