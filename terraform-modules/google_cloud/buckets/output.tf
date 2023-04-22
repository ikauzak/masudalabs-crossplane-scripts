output "bucket_name" {
  description = "Bucket name"
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "Bucket url"
  value       = google_storage_bucket.bucket.url
}
