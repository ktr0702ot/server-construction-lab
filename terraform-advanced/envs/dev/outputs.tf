output "vpc_id" {
  description = "作成したVPCのID"
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "作成したサブネットのID"
  value       = module.network.subnet_id
}