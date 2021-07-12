variable "vpc_id" {
  type        = string
  description = "VPC ID of network."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of at least 2 subnets in different AZs for DB subnet group"
}

variable "security_group_ids" {
  description = "List of security group IDs to allow ingress from (i.e. Spark cluster SG IDs, Tamr VM SG ID)"
  type        = list(string)
}

variable "name_prefix" {
  description = "A string to prepend to names of resources created by this example"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks to attach to security groups for ingress"
  type = list(string)
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks to attach to security groups for egress"
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional tags for resources created by this example"
  default     = { 
    Author = "Tamr"
    Environment = "Example"
  }
}

