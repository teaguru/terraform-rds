module "rds_postgres" {
  # source               = "git::https://github.com/Datatamer/terraform-aws-rds-postgres.git?ref=2.0.0"
  source = "../.."

  identifier_prefix    = "example-rds-pg-"
  postgres_name        = "example0"
  parameter_group_name = "example-rds-postgres-pg"
  username             = "exampleUsername"
  password             = "examplePassword" #tfsec:ignore:GEN003

  vpc_id            = var.vpc_id
  subnet_group_name = "example_subnet_group"
  # Network requirement: DB subnet group needs a subnet in at least two Availability Zones
  rds_subnet_ids = var.subnet_ids
  ingress_sg_ids = var.ingress_sg_ids
}

module "sg-ports" {
  # source               = "git::https://github.com/Datatamer/terraform-aws-rds-postgres.git?ref=2.0.0"
  source = "../../modules/rds-postgres-ports"
}

module "rds-postgres-sg" {
  source = "git::git@github.com:Datatamer/terraform-aws-security-groups.git?ref=1.0.0"
  vpc_id = var.vpc_id
  ingress_cidr_blocks = [
    "1.2.3.0/24"
  ]
  egress_cidr_blocks = [
    "0.0.0.0/0"
  ]
  ingress_ports  = module.sg-ports.ingress_ports
  sg_name_prefix = var.name-prefix
  egress_protocol = "all"
  ingress_protocol = "tcp"
}
