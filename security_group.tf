resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg_egress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group_rule" "allow_cluster_ingress" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = [aws_subnet.private_1.cidr_block, aws_subnet.private_2.cidr_block]
}
