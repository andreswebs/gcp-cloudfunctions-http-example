data "google_project" "this" {}

resource "google_cloudfunctions_function" "this" {
  name                = var.function_name
  region              = var.region
  description         = var.function_description
  runtime             = "nodejs18"
  entry_point         = "main"
  timeout             = 540
  available_memory_mb = 256
  max_instances       = 5
  trigger_http        = true

  https_trigger_security_level = "SECURE_ALWAYS"

  service_account_email = google_service_account.this.email
  source_archive_bucket = var.code_artifacts_bucket
  source_archive_object = var.function_object


  environment_variables = {
    CLOUDSDK_CORE_PROJECT = data.google_project.this.project_id
  }

  labels = {}

  lifecycle {
    create_before_destroy = true
  }

}

resource "google_cloud_scheduler_job" "this" {
  count       = var.schedule_enabled ? 1 : 0
  name        = var.schedule_name
  region      = var.region
  description = "function trigger"
  schedule    = var.schedule_cron
  time_zone   = var.schedule_time_zone

  retry_config {
    retry_count = 1
  }

  http_target {
    http_method = "POST"
    uri         = google_cloudfunctions_function.this.https_trigger_url
    body        = base64encode(var.schedule_http_body)
    headers = {
      "Content-Type" = "application/json"
    }

    oidc_token {
      service_account_email = google_service_account.invoker.email
    }
  }

}
