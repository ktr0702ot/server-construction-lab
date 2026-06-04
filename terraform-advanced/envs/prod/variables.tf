variable "region" {
  description = "AWSリージョン"
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名"
  default     = "terraform-prod"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  description = "サブネットのCIDRブロック"
  default     = "172.16.1.0/24"
}