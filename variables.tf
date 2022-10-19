# allows control of common tags from tfvars, such as:
# cht_owner, cht_function, cht_subfunction, cht_managment, cht_tower
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags to apply on all cluster infrastructure"
}

# route53 domain (public and private) to create
variable "domain" {
  type        = string
  description = "Name of route53 domain (public and private) to create"
}

variable "eks_vpc_id" {
  type        = string
  description = "VPC ID used for EKS from cht-terraform-eks"
}

variable "eks_cluster_names" {
  type = list(string)
}

variable "vpn_sg_id" {
  type        = string
  description = "VPN Security GroupID"
}