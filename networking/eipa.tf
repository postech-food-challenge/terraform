resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "nat_1"
  }
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "nat_2"
  }
}