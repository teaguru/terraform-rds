module "rds_postgres" {
  source               = "git::https://github.com/Datatamer/terraform-rds-postgres.git?ref=0.1.0"
  postgres_name        = "example_rds_postgres"
  parameter_group_name = "example-rds-postgres-pg"
  identifier_prefix    = "example-rds-"

  username = "exampleUsername"
  password = "examplePassword"

  subnet_name          = "example_subnet"
  spark_cluster_sg_ids = ["sg-examplesecuritygroup1", "sg-examplesecuritygroup2"]
  tamr_vm_sg_id        = "sg-exampletamrsecuritygroup"
  vpc_id               = "vpc-examplevpcnetworkid"
}
