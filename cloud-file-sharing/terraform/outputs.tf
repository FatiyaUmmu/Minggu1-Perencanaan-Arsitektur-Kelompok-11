# ============================================
# Outputs - Informasi Resource yang Dibuat
# ============================================

# VPC Information
output "vpc_name" {
  description = "Name of the VPC"
  value       = google_compute_network.vpc_network.name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = google_compute_network.vpc_network.id
}

output "vpc_self_link" {
  description = "Self-link of the VPC"
  value       = google_compute_network.vpc_network.self_link
}

# Subnet Information
output "public_subnet_name" {
  description = "Name of the public subnet"
  value       = google_compute_subnetwork.public_subnet.name
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = google_compute_subnetwork.public_subnet.id
}

output "private_subnet_name" {
  description = "Name of the private subnet"
  value       = google_compute_subnetwork.private_subnet.name
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = google_compute_subnetwork.private_subnet.id
}

# VM Information
output "vm1_name" {
  description = "Name of VM 1"
  value       = google_compute_instance.vm1.name
}

output "vm1_public_ip" {
  description = "Public IP address of VM 1"
  value       = google_compute_instance.vm1.network_interface[0].access_config[0].nat_ip
}

output "vm1_internal_ip" {
  description = "Internal IP address of VM 1"
  value       = google_compute_instance.vm1.network_interface[0].network_ip
}

output "vm2_name" {
  description = "Name of VM 2"
  value       = google_compute_instance.vm2.name
}

output "vm2_public_ip" {
  description = "Public IP address of VM 2"
  value       = google_compute_instance.vm2.network_interface[0].access_config[0].nat_ip
}

output "vm2_internal_ip" {
  description = "Internal IP address of VM 2"
  value       = google_compute_instance.vm2.network_interface[0].network_ip
}

# Service Account
output "service_account_email" {
  description = "Email of the service account"
  value       = google_service_account.file_sharing_sa.email
}

# General Information
output "project_id" {
  description = "GCP Project ID"
  value       = var.project_id
}

output "region" {
  description = "GCP Region"
  value       = var.region
}

output "environment" {
  description = "Environment"
  value       = var.environment
}