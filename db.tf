resource "aws_db_subnet_group" "_" {
  name       = "rds-sunetg"
  subnet_ids = [aws_subnet.mysubnet2.id, aws_subnet.mysubnet.id]
}

resource "aws_db_instance" "mysql-db" {
  identifier        = "database-4"
  storage_type      = "gp2"
  allocated_storage = 20 # don't use  max_allocated_storage for disable autoscaling
  engine            = "mysql"
  engine_version    = "5.7.40"
  instance_class    = "db.t2.micro"
  db_name           = "data"
  port              = "3306"
  username          = "admin"
  password          = "rajat#9776"

  db_subnet_group_name = aws_db_subnet_group._.id

  vpc_security_group_ids     = [aws_security_group.mysg.id]
  parameter_group_name       = "default.mysql5.7"
  availability_zone          = "ap-south-1a"
  publicly_accessible        = true
  deletion_protection        = true
  skip_final_snapshot        = true
  auto_minor_version_upgrade = false
  tags = {
    Name = "demomysql"
  }
}
