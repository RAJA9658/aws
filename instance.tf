resource "aws_instance" "web" {
  #count= 2
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id              = aws_subnet.mysubnet.id
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = false
    iops        = 100
  }
  volume_tags = {
    Name = "web-volume"
  }

  user_data = file("script.sh") # directory path of userdata =/var/lib/cloud/instances/

  tags = {
    #Name = "webapp -${count.index + 1}"
    Name = "web app"
  }
}



## this is for key-pair
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("id_rsa.pub")
}

resource "aws_eip" "IP" {
  vpc = true

  public_ipv4_pool = "amazon"
}
//this is use for attach elastic_IPaddress
resource "aws_eip_association" "eip_ass" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.IP.id
}

