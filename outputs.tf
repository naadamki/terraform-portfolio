output "cloudfront_url" {
  description = "Your live portfolio URL"
  value       = "https://${module.site.cloudfront_domain}"
}

output "api_endpoint" {
  description = "Visitor counter API"
  value       = "${module.api.api_endpoint}/count"
}

output "s3_bucket_name" {
  description = "Upload your HTML here"
  value       = module.site.bucket_name
}
