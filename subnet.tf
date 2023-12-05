resource "aws_subnet" "mysubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet1_cidr_block
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "mysubnet"
  }

}
resource "aws_subnet" "mysubnet2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet2_cidr_block
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "mysubnet2"
  }

}

resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygate.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.publicRouteTable.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.mysubnet2.id
  route_table_id = aws_route_table.publicRouteTable.id
}

