data "vault_generic_secret" "db_credentials" {
  path = "${db_credentials_vault_path}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "${var.terraformer_bucket}"
    key = "${var.vpc_remote_state_key}"
    region = "${var.aws_region}"
  }
}