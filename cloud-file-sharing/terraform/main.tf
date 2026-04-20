# ============================================
# Main Configuration - Cloud File Sharing System
# Kelompok 12 - Final Project Cloud Computing
# Google Cloud Platform (GCP)
# ============================================

# ============================================
# COMMON LABELS
# ============================================
locals {
  common_labels = {
    environment = var.environment
    project     = var.project_name
    team        = var.team_name
    managed_by  = "terraform"
  }
}

# ============================================
# VPC NETWORK
# ============================================
resource "google_compute_network" "vpc_network" {
  name                    = "${var.project_name}-vpc"
  auto_create_subnetworks = false
  description             = "VPC untuk Cloud File Sharing System - Kelompok 12"
  # Catatan: 'labels' dihapus karena tidak didukung di google_compute_network pada provider v5.x
}

# ============================================
# PUBLIC SUBNET
# ============================================
resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.project_name}-public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
  
  private_ip_google_access = true
  # Catatan: 'labels' dihapus karena tidak didukung di google_compute_subnetwork pada provider v5.x
}

# ============================================
# PRIVATE SUBNET
# ============================================
resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.project_name}-private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
  
  private_ip_google_access = true
  # Catatan: 'labels' dihapus karena tidak didukung di google_compute_subnetwork pada provider v5.x
}

# ============================================
# FIREWALL RULES
# ============================================

# Allow SSH (port 22)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.project_name}-allow-ssh"
  network = google_compute_network.vpc_network.name
  
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH access untuk akses VM"
}

# Allow HTTP (port 80)
resource "google_compute_firewall" "allow_http" {
  name    = "${var.project_name}-allow-http"
  network = google_compute_network.vpc_network.name
  
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow HTTP untuk akses aplikasi web"
}

# Allow HTTPS (port 443)
resource "google_compute_firewall" "allow_https" {
  name    = "${var.project_name}-allow-https"
  network = google_compute_network.vpc_network.name
  
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow HTTPS untuk akses aman"
}

# Allow Internal Traffic
resource "google_compute_firewall" "allow_internal" {
  name    = "${var.project_name}-allow-internal"
  network = google_compute_network.vpc_network.name
  
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  
  allow {
    protocol = "icmp"
  }
  
  source_ranges = ["10.0.0.0/8"]
  description   = "Allow internal traffic dalam VPC"
}

# Allow MySQL (port 3306) untuk Cloud SQL
resource "google_compute_firewall" "allow_mysql" {
  name    = "${var.project_name}-allow-mysql"
  network = google_compute_network.vpc_network.name
  
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
  
  source_ranges = ["10.0.0.0/8"]
  description   = "Allow MySQL untuk Cloud SQL"
}

# Service Account sudah didefinisikan di iam.tf, jadi tidak perlu diduplikasi di sini.

# ============================================
# COMPUTE INSTANCES (VM)
# ============================================

# VM 1 - Web Server
resource "google_compute_instance" "vm1" {
  name         = "${var.project_name}-vm-web-1"
  machine_type = var.machine_type
  zone         = var.vm_zone
  description  = "Web server 1 untuk Cloud File Sharing"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
      type  = "pd-ssd"
    }
  }
  
  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    access_config {
      # Mendapatkan public IP ephemeral
    }
  }
  
  service_account {
    email  = google_service_account.file_sharing_sa.email
    scopes = ["cloud-platform"]
  }
  
  labels = local.common_labels
  
  metadata = {
    environment = var.environment
    team        = var.team_name
  }
  
  metadata_startup_script = <<-EOF
    #!/bin/bash
    echo "VM Web 1 - Cloud File Sharing System" > /etc/motd
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<h1>Cloud File Sharing - VM 1</h1>" > /var/www/html/index.html
  EOF
}

# VM 2 - Web Server
resource "google_compute_instance" "vm2" {
  name         = "${var.project_name}-vm-web-2"
  machine_type = var.machine_type
  zone         = var.vm_zone
  description  = "Web server 2 untuk Cloud File Sharing"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
      type  = "pd-ssd"
    }
  }
  
  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    access_config {
      # Mendapatkan public IP ephemeral
    }
  }
  
  service_account {
    email  = google_service_account.file_sharing_sa.email
    scopes = ["cloud-platform"]
  }
  
  labels = local.common_labels
  
  metadata = {
    environment = var.environment
    team        = var.team_name
  }
  
  metadata_startup_script = <<-EOF
    #!/bin/bash
    echo "VM Web 2 - Cloud File Sharing System" > /etc/motd
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<h1>Cloud File Sharing - VM 2</h1>" > /var/www/html/index.html
  EOF
}