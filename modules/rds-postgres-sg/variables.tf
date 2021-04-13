variable "security_group_name" {
  description = "Name for the security group for the rds instance"
  type        = string
  default     = "tamr_rds_sg"
}

variable "ingress_sg_ids" {
  description = "List of security group IDs to allow ingress from (i.e. Spark cluster SG IDs, Tamr VM SG ID)"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the rds security group"
  type        = string
}

variable "additional_cidrs" {
  description = "Additional CIDR to connect to RDS Postgres instance"
  type        = list(string)
  default     = []
}

variable "additional_tags" {
  description = "Additional tags to set on the RDS instance"
  type        = map(string)
  default     = {}
}
