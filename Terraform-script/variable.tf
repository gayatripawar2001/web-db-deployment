variable "region" {
  description = "AWS Deployment region.."
  default = "us-east-1"
}

variable "ami" {
  description = "Map of AMIs by region"
  type        = map(string)
  default = {
    us-east-1 = "ami-04b70fa74e45c3917",  # Example AMI ID for us-east-1
  }
}
variable "environment" {
  default = "test"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "gayatri"  # Update this to the actual key pair name
}

variable "vpc_cidr" {
type = string
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
type = string
  default = "10.0.0.0/17"
}

variable "availability_zones" {
default = "us-east-1a"
} 

variable "private_subnets_cidr" {
  default = "10.0.128.0/17"
  type = string
}
