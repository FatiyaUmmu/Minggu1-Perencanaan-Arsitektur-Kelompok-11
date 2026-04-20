# ============================================
# Variables - Cloud File Sharing System
# Kelompok 12 - Final Project Cloud Computing
# ============================================

variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "project-0086ed28-c631-4192-b99"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-southeast2"  # Jakarta
}

variable "environment" {
  description = "Environment (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "machine_type" {
  description = "Machine type for VM instances"
  type        = string
  default     = "e2-medium"
}

variable "vm_zone" {
  description = "GCP Zone for VM instances"
  type        = string
  default     = "asia-southeast2-a"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "cloud-file-sharing"
}

variable "team_name" {
  description = "Team name for resource tagging"
  type        = string
  default     = "kelompok-12"
}