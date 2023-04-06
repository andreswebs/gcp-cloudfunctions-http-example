output "function" {
  description = "The `google_cloudfunctions_function` resource"
  value       = google_cloudfunctions_function.this
}

output "service_account" {
  description = "IAM service account used by the cloud function"
  value       = google_service_account.this
}
