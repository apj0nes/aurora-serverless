resource "aws_rds_cluster" "db" {
  cluster_identifier = "${module.naming.aws_db_instance}"
  engine = "${var.engine}"
  engine_mode = "serverless"
  master_password = "${data.vault_generic_secret.db_credentials.data["password"]}"
  master_username = "${data.vault_generic_secret.db_credentials.data["username"]}"
  port = "${var.port}"
  vpc_security_group_ids = ["${aws_security_group.sql.id}"]
  iam_database_authentication_enabled = true
  database_name = "${var.database_name}"

  scaling_configuration {
    auto_pause  = true
    max_capacity = "${var.max_capacity}"
    min_capacity = "${var.min_capacity}"
    seconds_until_auto_pause = 300
    timeout_action = "ForceApplyCapacityChange"
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = "${var.tags}"
}