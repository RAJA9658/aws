
resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

dynamic "ingress" {
    for_each = [22,3306,80]
    content {
      
      from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    }
  }

  tags = {
    Name = "mysg"
  }
}

    