output "vpc_id" {
  description = "作成したVPCのID"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "作成したサブネットのID"
  value       = aws_subnet.main.id
}