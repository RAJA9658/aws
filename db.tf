resource "aws_db_subnet_group" "_" {
  name       = "rds-sunetg"
  subnet_ids = [aws_subnet.rajasubnet2.id , aws_subnet.rajasubnet.id ]
}
  
  
  
  
   resource "aws_db_instance" "mysql-db"  {
    identifier = "database-3"
    storage_type =  "gp2"
    allocated_storage =20
    engine = "mysql"
    engine_version = "8.0.28"
    instance_class = "db.t2.micro"
    port = "3306"
    username = "admin"
    password = "rajat#9776"
   // vpc_id = [aws_vpc.rajavpc.id]
    db_subnet_group_name    = aws_db_subnet_group._.id

    vpc_security_group_ids =  [aws_security_group.rajasg.id]
    parameter_group_name = "default.mysql8.0"
    availability_zone = "ap-south-1a"
    publicly_accessible = true
    deletion_protection = false
    skip_final_snapshot =true
    tags = {
        Name ="demomysql"
    }
}
