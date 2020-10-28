# Tamr AWS RDS Security Groups Terraform Module
This terraform module creates the security group and the security group rules for the AWS RDS instance

# Example
```
module "rds_sg" {
  source               = "git::https://github.com/Datatamer/terraform-aws-rds-postgres.git//modules/rds-postgres-sg?ref=0.4.0"
  ingress_sg_ids       = ["sg-examplesparksecuritygroup1", "sg-examplesparksecuritygroup2", "sg-exampletamrvmsecuritygroup"]
  vpc_id               = "vpc-examplevpcid"
  security_group_name  = "examplerdssecuritygroup"
  additional_cidrs     = ["1.2.3.4/32"]
}
```

# Resources Created
This terraform module will create:
* a security group for the RDS instance
* security group rules if additional CIDRs are provided

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
| ingress\_sg\_ids | List of security group IDs to allow ingress from (i.e. Spark cluster SG IDs, Tamr VM SG ID) | `list(string)` | n/a | yes |
| vpc\_id | VPC ID for the rds security group | `string` | n/a | yes |
| additional\_cidrs | Additional CIDR to connect to RDS Postgres instance | `list(string)` | `[]` | no |
| additional\_tags | Additional tags to set on the RDS instance | `map` | `{}` | no |
| security\_group\_name | Name for the security group for the rds instance | `string` | `"tamr_rds_sg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_sg\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
