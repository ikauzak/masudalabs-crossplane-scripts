resource "random_id" "example" {
  byte_length = 4
}

resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_name}-${terraform.workspace}-${random_id.example.hex}"
  location      = var.bucket_location
  project       = var.project_id
  force_destroy = var.bucket_force_destroy
  storage_class = var.bucket_storage_class

  labels = var.labels

  dynamic "versioning" {
    for_each = var.bucket_versioning == false ? [] : [1]
    content {
      enabled = true
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lookup(lifecycle_rule.value.action, "storage_class", null)
      }
      condition {
        age                        = lookup(lifecycle_rule.value.condition, "age", null)
        created_before             = lookup(lifecycle_rule.value.condition, "created_before", null)
        with_state                 = lookup(lifecycle_rule.value.condition, "with_state", null)
        matches_storage_class      = contains(keys(lifecycle_rule.value.condition), "matches_storage_class") ? split(",", lifecycle_rule.value.condition["matches_storage_class"]) : null
        num_newer_versions         = lookup(lifecycle_rule.value.condition, "num_newer_versions", null)
        custom_time_before         = lookup(lifecycle_rule.value.condition, "custom_time_before", null)
        days_since_noncurrent_time = lookup(lifecycle_rule.value.condition, "days_since_noncurrent_time", null)
        noncurrent_time_before     = lookup(lifecycle_rule.value.condition, "noncurrent_time_before", null)
      }
    }
  }
}

resource "google_storage_bucket_access_control" "public_role" {
  count  = var.public_bucket == true ? 1 : 0
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_iam_binding" "admins" {
  count   = length(var.bucket_admins) > 0 ? 1 : 0
  bucket  = google_storage_bucket.bucket.name
  role    = "roles/storage.admin"
  members = var.bucket_admins
}

resource "google_storage_bucket_iam_binding" "creators" {
  count   = length(var.bucket_creators) > 0 ? 1 : 0
  bucket  = google_storage_bucket.bucket.name
  role    = "roles/storage.objectCreator"
  members = var.bucket_creators
}

resource "google_storage_bucket_iam_binding" "viewers" {
  count   = length(var.bucket_viewers) > 0 ? 1 : 0
  bucket  = google_storage_bucket.bucket.name
  role    = "roles/storage.objectViewer"
  members = var.bucket_viewers
}
