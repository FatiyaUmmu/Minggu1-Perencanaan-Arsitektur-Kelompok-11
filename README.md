# Cloud File Sharing System — Kelompok 12

Sistem file sharing berbasis Google Cloud Platform (GCP) yang memungkinkan
pengguna upload, download, dan berbagi file melalui antarmuka web.

## Arsitektur Singkat
User → Cloud CDN → Compute Engine → Cloud Storage / Cloud SQL
Semua komponen dipantau oleh Cloud Monitoring & Cloud Logging.

## Layanan GCP yang Digunakan
- Compute Engine (VM e2-medium) — server aplikasi backend
- Cloud Storage (500 GB Standard) — penyimpanan file
- Cloud SQL (db-f1-micro MySQL) — metadata file
- Cloud CDN — distribusi konten statis
- Cloud Monitoring + Cloud Logging — observabilitas
- Cloud IAM — manajemen akses

  ## Anggota Kelompok
| Nama | NIM | Role |
|------|-----|------|
| [Nama 1] | [NIM] | Cloud Architect |
| [Nama 2] | [NIM] | DevOps Engineer |
| [Nama 3] | [NIM] | Backend Developer |
| [Nama 4] | [NIM] | Security Engineer |

## Platform Cloud
Google Cloud Platform (GCP) — Region: asia-southeast2 (Jakarta)

## Minggu Saat Ini
Minggu 1 — Perencanaan & Arsitektur
