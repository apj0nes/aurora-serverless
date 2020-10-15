# aurora-serverless

Terraform module that enables the provisioning of a aurora serverless cluster

This module requires a Vault setup to pull credentials for the cluster.
IAM authentication is enabled allowing consuming applications to authenticate without username/password credentials.

The module is can be used to create any AWS aurora serverless supported engine, at the time of writting, this is MySQL and Postgresql.

For a list of assumptions and dependencies please see https://github.com/apj0nes/rails-example#assumptions

## Usage

An example repository consuming the module can be seen here https://github.com/apj0nes/rails-example

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| tags | Resource tags | string | - | yes |
| max_capacity | The maximum the cluster will scale to | string | `256` | no |
| terraformer_bucket | S3 bucket holding the remote state | string | - | yes |
| vpc_remote_state_key | Key used to lookup the remote state within the S3 bucket | string | - | yes |
| min_capacity | The minimum the cluster will scale to | string | `2` | no |
| engine | The database engine | string | `aurora-mysql` | no |
| port | The database port | string | `3306` | no |
| vault_address | The address of the Vault instance | string | `https://vault.example.net:8200` | no |
| aws_region | The AWS region to deploy to | string | `eu-west-1` | no |
| db_credentials_vault_path | The port the application is served on | string | - | yes |
| database_name | The database name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| r53_dns | The route 53 alias for the db cluster |