variable "security_group_name" {
  description = "Name for the security group for the rds instance"
  type = string
  default = "tamr_rds_sg"
}

variable "tamr_vm_sg_id" {
  description = "Security group id attached to the tamr vm"
  type = string
}

variable "spark_cluster_sg_ids" {
  description = "Security group is attached to the ec2 instances of EMR Spark"
  type = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the rds security group"
  type = string
}

variable "additional_cidrs" {
  description = "Additional CIDR to connect to RDS Postgres instance"
  type = list(string)
  default = []
}

variable "additional_tags" {
  description = "Additional tags to set on the RDS instance"
  type = map
  default = {}
}
