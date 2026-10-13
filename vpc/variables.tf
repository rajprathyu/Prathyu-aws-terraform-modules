variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "public_subnets" {
  description = "Map of public subnet definitions"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))

  default = {}
}

variable "private_subnets" {
  description = "Map of private subnet definitions"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))

  default = {}
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway for private subnet internet access"
  type        = bool
  default     = true
}

variable "region" {
  description = "Name of the VPC"
  type        = string
}


