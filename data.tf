data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_eks_cluster" "clusters" {
  for_each = toset(var.eks_cluster_names)
  name     = each.key
}

data "aws_vpc" "eks" {
  id = var.eks_vpc_id
}

data "aws_subnet_ids" "eks_private" {
  vpc_id = data.aws_vpc.eks.id
  filter {
    name   = "tag:Name"
    values = ["*.private.eks.stg.cloudhealthtech.com"]
  }
}

data "aws_subnet_ids" "eks_public" {
  vpc_id = data.aws_vpc.eks.id
  filter {
    name   = "tag:Name"
    values = ["*.private.eks.stg.cloudhealthtech.com"]
  }
}

data "aws_security_group" "eks_node_groups" {
  for_each = data.aws_eks_cluster.clusters
  name     = "${each.key}-nodegroup"
  vpc_id   = data.aws_vpc.eks.id
}

data "aws_s3_bucket" "logging_bucket" {
  bucket = "detailed-logging-ng-staging"
}

data "aws_route53_zone" "stg_private" {
  name         = "stg.cloudhealthtech.com."
  vpc_id       = "vpc-0f1f6ed2a90a003d7"
  private_zone = true
}