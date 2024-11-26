output "s3_bucket_url" {
  value = aws_s3_bucket_website_configuration.ecommerce_bucket_website.website_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
