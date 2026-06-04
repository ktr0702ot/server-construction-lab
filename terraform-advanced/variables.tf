variable "region" {
  description = "AWSリージョン"
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名"
  default     = "terraform-advanced"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "サブネットのCIDRブロック"
  default     = "10.0.1.0/24"
}