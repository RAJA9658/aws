resource "aws_subnet"  "rajasubnet" {
    vpc_id = aws_vpc.rajavpc.id
    cidr_block = "10.0.1.0/24"
     availability_zone = "ap-south-1a"
    map_public_ip_on_launch ="true"
     tags = {
    Name = "rajasubnet"
  }

}
resource "aws_subnet"  "rajasubnet2" {
    vpc_id = aws_vpc.rajavpc.id
    cidr_block = "10.0.5.0/24"
     availability_zone = "ap-south-1b"
    map_public_ip_on_launch ="true"
     tags = {
    Name = "rajasubnet2"
  }

}

resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.rajavpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygate.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.rajasubnet.id  
  route_table_id = aws_route_table.publicRouteTable.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.rajasubnet2.id  
  route_table_id = aws_route_table.publicRouteTable.id
}

