output "vpc-id" {
  value       = aws_vpc.main.id
  description = "VPC id"
  sensitive   = false
}

output "public-subnet-id-1" {
  value = aws_subnet.public_1.id
  description = "ID da subnet pública 1"
  sensitive   = false
}

output "public-subnet-id-2" {
  value = aws_subnet.public_2.id
  description = "ID da subnet pública 2"
  sensitive   = false
}

output "private-subnet-id-1" {
  value = aws_subnet.private_1.id
  description = "ID da subnet privada 1"
  sensitive   = false
}

output "private-subnet-id-2" {
  value = aws_subnet.private_2.id
  description = "ID da subnet privada 2"
  sensitive   = false
}