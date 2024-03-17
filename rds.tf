resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id,
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  tags = {
    Name = "db_subnet"
  }
}

resource "aws_db_instance" "rds" {
  db_name                = "foodchallenge"
  allocated_storage      = 10
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  identifier             = "rds"
  username               = "foodchallenge"
  password               = "root1234"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg.id]
  publicly_accessible    = true
  multi_az               = true
  tags = {
    Name = "rds"
  }
  depends_on = [aws_db_subnet_group.db_subnet_group]
}