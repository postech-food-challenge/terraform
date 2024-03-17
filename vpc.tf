resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "main"
  }
}

output "vpn_id" {
  value       = aws_vpc.main.id
  description = "VPC id."
  sensitive   = false
}