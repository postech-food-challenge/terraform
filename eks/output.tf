output "nat-1" {
  value       = aws_eip.nat1.id
  description = "Nat 1 id"
  sensitive   = false
}

output "nat-2" {
  value       = aws_eip.nat2.id
  description = "Nat 2 id"
  sensitive   = false
}