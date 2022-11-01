 resource "aws_instance" "web" {
    ami = "ami-062df10d14676e201"
   instance_type = "t2.micro"
   key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id  = aws_subnet.mysubnet.id


  user_data = <<-EOF
  #!/bin/bash
  sudo apt update
      sudo apt install -y telnet 
      sudo apt install -y apache2
     sudo apt install docker.io -y
      sudo apt install mysql-client -y
  sudo usermod -a -G docker rajat
  docker pull wordpress
  docker run --name somewordpress -p 8080:80 -d wordpress
  docker start somewordpress
  EOF



   tags ={
    Name = "web app"
   } 
}

