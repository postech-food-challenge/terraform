resource "aws_nat_gateway" "gw1" {
  allocation_id = eks.nat-1
  subnet_id     = public-subnet-id-1

  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = eks.nat-2
  subnet_id     = public-subnet-id-2

  tags = {
    Name = "NAT 2"
  }
}