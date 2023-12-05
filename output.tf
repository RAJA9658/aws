output "instance_ip" {
  value = aws_instance.web.public_ip

}
#output "instance_ip2" {
# value = aws_instance.web[1].public_ip
#}
output "apache2_port_number" {
  value = ":80"
}
output "waiting_time" {
  value = "is 4min to install and 2min to apply ip over the browser"
}
output "rds_endpoint" {
  value = aws_db_instance.mysql-db.address
}
output "rds_port" {
  value = "3306"
}
