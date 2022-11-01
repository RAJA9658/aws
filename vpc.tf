resource  "aws_vpc"  "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    instance_tenancy = "default"
    tags = {
    Name = "myvpc"
  }

}
resource "aws_internet_gateway" "mygate" {
    vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my-gate"
  }
}
