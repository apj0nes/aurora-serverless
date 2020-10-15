resource "aws_route53_record" "db" {
  zone_id = "${module.zone.private_zone_id}"
  name = "${var.database_name}.${module.zone.private_zone}"
  type = "CNAME"
  ttl = "15"
  allow_overwrite = true
  records = ["${aws_rds_cluster.db.endpoint}"]
}