resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [
    networking.private-subnet-id-1,
    networking.private-subnet-id-2,
    networking.public-subnet-id-1,
    networking.public-subnet-id-2
  ]

  tags = {
    Name = "db_subnet"
  }
}

resource "aws_db_instance" "rds" {
  db_name              = "foodchallenge"
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  identifier           = "rds"
  username             = "foodchallenge"
  password             = "root1234"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible  = true
  multi_az             = true
  tags = {
    Name = "rds"
  }
  depends_on = [aws_db_subnet_group.db_subnet_group]
}