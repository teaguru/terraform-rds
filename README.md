# Tamr AWS RDS Terraform Module
This terraform module creates an AWS RDS postgres instance.
This repo follows the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "rds_postgres" {
    source = "git::https://github.com/Datatamer/terraform-rds-postgres.git?ref=0.1.0"
    postgres_name = "example_rds_postgres"
    parameter_group_name = "example-rds-postgres-pg"
    identifier_prefix = "example-rds-"

    username = "exampleUsername"
    password = "examplePassword"

    subnet_name = "example_subnet"
    spark_cluster_sg_ids = ["sg-examplesecuritygroup1", "sg-examplesecuritygroup2"]
    tamr_vm_sg_id = "sg-exampletamrsecuritygroup"
    vpc_id = "vpc-examplevpcnetworkid"
}
```

# Resources Created
This terraform module will create:
* an AWS RDS Postgres instance
* database parameter group
* A security group for the rds instance

# Variables
## Inputs
* `password` (required): The postgres password
* `tamr_vm_sg_id` (required): Security group id attached to the tamr vm
* `spark_cluster_sg_id` (required): Security group is attached to the ec2 instances of EMR Spark
* `vpc_id` (required): VPC ID for the rds security group
* `username` (optional): The postgres username
* `postgres_name` (optional): The name of the postgres instance
* `parameter_group_name` (optional): The name of the rds parameter group
* `identifier_prefix` (optional): Identifier prefix for the RDS instance
* `subnet_name` (optional): The name of the subnet to add the RDS instance to
* `allocated_storage` (optional): Allocate storage
* `max_allocated_storage` (optional): Max allocate storage
* `storage_type` (optional): Storage type (e.g. gp2, io1)
* `instance_class` (optional): Instance class
* `maintenance_window` (optional): Maintenance window
* `backup_window` (optional): Backup window
* `backup_retention_period` (optional): Backup retention period in days
* `skip_final_snapshot` (optional): Skip final snapshot
* `apply_immediately` (optional): Apply immediately, do not set this to true for production
* `copy_tags_to_snapshot` (optional): Copy tags to snapshots
* `additional_tags` (optional): Tags to set on the RDS instance
* `security_group_name` (optional): Name for the security group for the rds instance
* `additional_cidrs` (optional): Additional CIDR to connect to RDS Postgres instance

## Outputs
* `rds_postgres_pg_id`: ID of the RDS postgres parameter group
* `rds_postgres_id`: ID of the of the RDS instance
* `rds_sg_id`: ID of the security group attached to the RDS instance

# References
* AWS RDS: https://aws.amazon.com/rds/features/
* Terraform module structure: https://www.terraform.io/docs/modules/index.html#standard-module-structure

# Development
## Releasing new versions
* Updated version contained in `VERSION`
* Documented changes in `CHANGELOG.md`

# License
Apache 2 Licensed. See LICENSE for full details.
