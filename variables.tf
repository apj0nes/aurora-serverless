variable "max_capacity" {
  default = "256"
}

variable "min_capacity" {
  default = "2"
}

variable "engine" {
  default = "aurora-mysql"
}

variable "port" {
  default = "3306"
}

variable "vault_address" {
  default = "https://vault.example.net:8200"
}

variable "aws_region" {
    default = "eu-west-1"
}

variable "terraformer_bucket"{}

variable "vpc_remote_state_key" {}

variable "db_credentials_vault_path" {}

variable "database_name" {}

variable "tags" {
  type = "map"
}