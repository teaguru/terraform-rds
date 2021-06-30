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

variable "name-prefix" {
  description = "A string to prepend to names of resources created by this example"
}

variable "ports" {
  type        = list(number)
  description = "Ports used by RDS Postgres"
  default = [
    5432
  ]
}

variable "additional_ports" {
  type        = list(number)
  description = "Additional ports to add to the output of this module"
  default     = []
}
