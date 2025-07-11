
# add variables for aws region  
variable "aws_region" {
  description = "AWS region to deploy resources in "
  type = string
  default = "eu-central-1"
}

# vpc moduel varibales 
variable "project_name" {
  description = "Prefix for resource names"
  type        = string
  default     = "demo"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}
