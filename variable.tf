##################################################################################
# VARIABLES
##################################################################################

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_subnet_count" {
  type        = number
  description = "Number of subnets to create in VPC"
  default     = 3
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
  default     = "t2.micro"
}

variable "instance_count" {
  type        = number
  description = "Number of instances to create in VPC"
  default     = 3

}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Altschool"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "project_code" {
  type        = string
  description = "Billing code for resource tagging"
}

variable "domain_name" {
  default     = "afeezadeboye.me"
  description = "domain name"
  type        = string
}

variable "record_name" {
  default     = "terraform-test"
  description = "sub domain  name"
  type        = string
}

variable "sub_domain_name" {
  default     = "terraform-test.afeezadeboye.me"
  description = "sub domain  name"
  type        = string
}

variable "ssh_key" {
  description = "SSH Key name"
  type = string
}


