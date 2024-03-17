resource "aws_internet_gateway" "main" {
  vpc_id = vpc-id

  tags = {
    Name = "main"
  }
}