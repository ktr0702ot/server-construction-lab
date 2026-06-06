# Terraform CI/CDテスト

variable "region" {
  description = "AWSリージョン"
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名"
  default     = "terraform-ansible"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "サブネットのCIDRブロック"
  default     = "10.0.1.0/24"
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-0599b6e53ca798bb2"
}

variable "instance_type" {
  description = "インスタンスタイプ"
  default     = "t2.micro"
}

variable "public_key" {
  description = "SSH公開鍵"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+zSni65ny0keoMCgdlSdYJ41piQuCzHAgd1Lj+t+P2w5UcDu+yxwulRLWVsARmBj3HgKhqlP2WSoC0SbvdjiyY7XdV1StjIIVNYwLhWpiURFgmmUMvbtsRNHw82XUyrxg4Tj1sdDzDUk3Bx2KQbYmstUtz7VkfwHpTodrLxRio32Mj0xZgJ+GcnKqc7i8hG+YSI15MHP+S9vToOdBbNiyoEDRoA02ktq3dTOPbNHhI+DVMtrKnisqVWE+fgAEtxwcYPIHgqP5bminFfl79MlNRtJFf/NitHBGYmRf3CqGuDnzV4WhqSjSoCneHlPVnHSBO9z8jsJ8UEpWaQ4OhWstnuj0NNE10NcjdZJ8l1AKiiPPxaxt5UINGaREpXstfvzRtSzqJbsxGpfxpPyGUVDjMWee9371bxrxdBhFH1fD+cBLuutjjlzyNtJkAMuGrOoZFYdqs8eZTrpkINzPho26o7ddJxzqibFn0om1YWY0SWI2UZNiwkOqT7O2iN+9F4ez6bGyGUv2y8AVnLgiMj5HKWC3lQijtLzn/9cObSvKA4aBt6aPLQ7oREYV//zXIxCi39WVPuTE4bPdDnb6EfSylMDBuY08mn3F6M1dW0g8Uc4DalhUcZFnFiVQhIbwiXYeIcTZUNNJdNumNwOu7EVUZEUnjtPUp7cRL7hM6IePuQ=="
}