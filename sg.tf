resource "aws_security_group" "sql" {
  name = "${module.naming.aws_security_group}sql"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  
  tags = "${var.tags}"
}

resource "aws_security_group_rule" "admin" {
  security_group_id = "${aws_security_group.sql.id}"
  type = "ingress"
  from_port = "${var.port}"
  to_port = "${var.port}"
  protocol = "tcp"
  cidr_blocks = [
    "${data.terraform_remote_state.vpc.vpc_cidr}"
  ]
}
