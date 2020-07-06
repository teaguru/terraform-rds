# Tamr AWS RDS Security Groups Terraform Module
This terraform module creates the security group and the security group rules for the AWS RDS instance

# Example
```
module "rds_sg" {
    source = "./modules/rds-postgres-sg"
    spark_cluster_sg_ids = ["sg-examplesparksecuritygroup1", "sg-examplesparksecuritygroup2"]
    tamr_vm_sg_id = "sg-exampletamrvmsecuritygroup"
    vpc_id = "vpc-examplevpcid"
    security_group_name = "examplerdssecuritygroup"
    additional_cidrs = ["1.2.3.4/32"]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spark\_cluster\_sg\_ids | List of Security groups attached to the ec2 instances of EMR Spark | `list(string)` | n/a | yes |
| tamr\_vm\_sg\_id | Security group id attached to the tamr vm | `string` | n/a | yes |
| vpc\_id | VPC ID for the rds security group | `string` | n/a | yes |
| additional\_cidrs | Additional CIDR to connect to RDS Postgres instance | `list(string)` | `[]` | no |
| additional\_tags | Additional tags to set on the RDS instance | `map` | `{}` | no |
| security\_group\_name | Name for the security group for the rds instance | `string` | `"tamr_rds_sg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_sg\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# AWS Resources created
This terraform module creates 1 Security Group:
* A security group for the RDS instance

This terraform module also creates Security Group Rules. The number of Security Group rules vary depending on the additional CIDRs provided.
