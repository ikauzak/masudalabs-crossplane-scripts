output "bucket_name" {
  description = "Bucket name"
  value       = google_storage_bucket.lmbr-bucket.name
}

output "bucket_url" {
  description = "Bucket url"
  value       = google_storage_bucket.lmbr-bucket.url
}
