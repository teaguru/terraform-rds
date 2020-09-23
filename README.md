# Tamr AWS RDS Terraform Module
This terraform module creates an AWS RDS postgres instance that will be used by TAMR.
This repo follows the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "rds_postgres" {
  source               = "git::https://github.com/Datatamer/terraform-aws-rds-postgres.git?ref=0.3.0"
  postgres_name        = "example_rds_postgres"
  parameter_group_name = "example-rds-postgres-pg"
  identifier_prefix    = "example-rds-"
  username             = "exampleUsername"
  password             = "examplePassword"

  subnet_group_name    = "example_subnet"
  rds_subnet_ids       = ["example-subnet-1", "example-subnet-2"]
  spark_cluster_sg_ids = ["sg-examplesecuritygroup1", "sg-examplesecuritygroup2"]
  tamr_vm_sg_id        = "sg-exampletamrsecuritygroup"
  vpc_id               = "vpc-examplevpcnetworkid"
}
```
## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-aws-rds-postgres/tree/master/examples/minimal)

# Resources Created
This terraform module will create:
* an AWS RDS Postgres instance
* a database parameter group
* a security group for the rds instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2.45.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.45.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| password | The postgres password | `string` | n/a | yes |
| rds\_subnet\_ids | VPC subnet IDs in subnet group | `list(string)` | n/a | yes |
| spark\_cluster\_sg\_ids | Security group is attached to the ec2 instances of EMR Spark | `list(string)` | n/a | yes |
| subnet\_group\_name | The name of the subnet group to add the RDS instance to | `string` | n/a | yes |
| tamr\_vm\_sg\_id | Security group id attached to the tamr vm | `string` | n/a | yes |
| vpc\_id | VPC ID for the rds security group | `string` | n/a | yes |
| additional\_cidrs | Additional CIDR to connect to RDS Postgres instance | `list(string)` | `[]` | no |
| additional\_tags | Additional tags to set on the RDS instance | `map` | `{}` | no |
| allocated\_storage | Allocate storage | `number` | `20` | no |
| apply\_immediately | Apply immediately, do not set this to true for production | `bool` | `false` | no |
| backup\_retention\_period | Backup retention period in days | `number` | `14` | no |
| backup\_window | Backup window | `string` | `"03:29-03:59"` | no |
| copy\_tags\_to\_snapshot | Copy tags to snapshots | `bool` | `true` | no |
| engine\_version | Version of RDS Postgres | `string` | `"12.3"` | no |
| identifier\_prefix | Identifier prefix for the RDS instance | `string` | `"tamr-rds-"` | no |
| instance\_class | Instance class | `string` | `"db.m4.large"` | no |
| maintenance\_window | Maintenance window | `string` | `"sun:04:32-sun:05:02"` | no |
| max\_allocated\_storage | Max allocate storage | `number` | `1000` | no |
| parameter\_group\_family | The family of the DB parameter group | `string` | `"postgres12"` | no |
| parameter\_group\_name | The name of the rds parameter group | `string` | `"rds-postgres-pg"` | no |
| postgres\_name | The name of the postgres instance | `string` | `"tamr_rds_db"` | no |
| security\_group\_name | Name for the security group for the rds instance | `string` | `"tamr_rds_sg"` | no |
| skip\_final\_snapshot | Skip final snapshot | `bool` | `true` | no |
| storage\_type | Storage type (e.g. gp2, io1) | `string` | `"gp2"` | no |
| username | The postgres username | `string` | `"tamr"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_hostname | n/a |
| rds\_postgres\_id | ID of the of the RDS instance |
| rds\_postgres\_pg\_id | ID of the RDS postgres parameter group |
| rds\_sg\_id | ID of the security group attached to the rds instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
* AWS RDS: https://aws.amazon.com/rds/features/
* Terraform module structure: https://www.terraform.io/docs/modules/index.html#standard-module-structure

# Development
## Releasing new versions
* Updated version contained in `VERSION`
* Documented changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
