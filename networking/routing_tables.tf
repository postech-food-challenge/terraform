resource "aws_route_table" "public" {
  vpc_id = vpc-id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private_1" {
  vpc_id = vpc-id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw1.id
  }
  tags = {
    Name = "private-1"
  }
}

resource "aws_route_table" "private_2" {
  vpc_id = vpc-id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw2.id
  }
  tags = {
    Name = "private-2"
  }
}