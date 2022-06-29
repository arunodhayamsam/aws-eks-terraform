variable "instance" {
  description = "Node instances"
  type        = string
  default     = ""
}

variable "ami" {
  description = "AMI of instances"
  type        = string
  default     = ""
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "aws_secrete_key" {
  description = "AWS secrete key"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "public_key" {
  description = "SSH key"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "cidr range for VPC"
  type        = string
  default     = ""
}

variable "pubsub1_cidr" {
  description = "cidr range for subnet"
  type        = string
  default     = ""
}

variable "pubsub2_cidr" {
  description = "cidr range for subnet"
  type        = string
  default     = ""
}

variable "pubsub3_cidr" {
  description = "cidr range for subnet"
  type        = string
  default     = ""
}