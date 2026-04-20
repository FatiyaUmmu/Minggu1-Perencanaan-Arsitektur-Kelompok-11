# Cloud File Sharing System — Kelompok 12

Sistem file sharing berbasis Google Cloud Platform (GCP) yang memungkinkan
pengguna upload, download, dan berbagi file melalui antarmuka web.

## Arsitektur Singkat
User → Cloud CDN → Compute Engine → Cloud Storage / Cloud SQL.
Semua komponen dipantau oleh Cloud Monitoring & Cloud Logging.

## Layanan GCP yang Digunakan
1. Compute Engine (VM e2-medium) — server aplikasi backend.
2. Cloud Storage (500 GB Standard) — penyimpanan file.
3. Cloud SQL (db-f1-micro MySQL) — metadata file.
4. Cloud CDN — distribusi konten statis.
5. Cloud Monitoring + Cloud Logging — observabilitas.
6. Cloud IAM — manajemen akses.

  ## Anggota Kelompok 12
1. Agatha Monalisa — NIM: 2330105030008 — Role: Security Engineer.
2. Muhammad Rony Kurniawan — NIM: 2330105030018 — Role: Backend Developer.
3. Ni Putu Lowryanty — NIM: 2330105030029 — Role: Cloud Architect.
4. Fatiya Ummu Hanifah Zahra — NIM: 2330205030042 — Role: DevOps Engineer.

## Platform Cloud
Google Cloud Platform (GCP) — Region: asia-southeast2 (Jakarta).

### Yang Telah Diimplementasikan
- [x] VPC dengan subnet publik & privat
- [x] Security Groups (prinsip least privilege)
- [x] 2 compute instances (via bastion)
- [x] IAM roles, policies, service accounts
- [x] SSH key pair untuk akses aman
- [x] Infrastructure as Code (Terraform)

## Minggu Saat Ini
Minggu 1 — Perencanaan & Arsitektur.

Minggu 2 — Implementasi Infrastruktur Dasar.
