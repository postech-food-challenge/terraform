resource "aws_eip" "nat1" {
  depends_on = [networking.internet-gateway]

  tags = {
    Name = "nat_1"
  }
}

resource "aws_eip" "nat2" {
  depends_on = [networking.internet-gateway]

  tags = {
    Name = "nat_2"
  }
}