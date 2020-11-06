variable "vpc_id" {
  type        = string
  description = "VPC ID of network."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of at least 2 subnets in different AZs for DB subnet group"
}

variable "ingress_sg_ids" {
  description = "List of security group IDs to allow ingress from (i.e. Spark cluster SG IDs, Tamr VM SG ID)"
  type        = list(string)
}
