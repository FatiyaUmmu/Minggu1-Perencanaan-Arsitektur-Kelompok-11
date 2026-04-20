# ============================================
# IAM Configuration - Service Account & Roles
# Prinsip Least Privilege
# ============================================

# Service Account untuk VM File Sharing
resource "google_service_account" "file_sharing_sa" {
  account_id   = "${var.project_name}-vm-sa"
  display_name = "Service Account untuk VM Cloud File Sharing - Kelompok 12"
  description  = "Service account dengan permission minimal untuk VM"
}

# Permission: Cloud Logging - Log Writer
resource "google_project_iam_member" "vm_sa_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.file_sharing_sa.email}"
}

# Permission: Cloud Monitoring - Metric Writer
resource "google_project_iam_member" "vm_sa_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.file_sharing_sa.email}"
}

# Permission: Cloud Storage - Object Viewer
resource "google_project_iam_member" "vm_sa_storage_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.file_sharing_sa.email}"
}

# Permission: Cloud SQL - Client
resource "google_project_iam_member" "vm_sa_sql_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.file_sharing_sa.email}"
}