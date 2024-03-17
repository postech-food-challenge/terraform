resource "aws_route_table_association" "public_1" {
  subnet_id      = public-subnet-id-1
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = public-subnet-id-2
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = private-subnet-id-1
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = private-subnet-id-2
  route_table_id = aws_route_table.private_2.id
}