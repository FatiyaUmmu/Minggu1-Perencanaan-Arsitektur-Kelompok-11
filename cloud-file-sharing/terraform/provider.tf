# ============================================
# Provider Configuration - Google Cloud
# ============================================

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"  # ← Izinkan versi 6.x atau lebih tinggi
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}