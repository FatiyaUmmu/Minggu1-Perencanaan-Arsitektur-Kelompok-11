Cloud File Sharing System — Kelompok 12
Sistem file sharing berbasis Google Cloud Platform (GCP) yang memungkinkan pengguna upload, download, dan berbagi file melalui antarmuka web.

Arsitektur Singkat
User → Cloud CDN → Compute Engine → Cloud Storage / Cloud SQL. Semua komponen dipantau oleh Cloud Monitoring & Cloud Logging.

Layanan GCP yang Digunakan
Compute Engine (VM e2-medium) — server aplikasi backend.
Cloud Storage (500 GB Standard) — penyimpanan file.
Cloud SQL (db-f1-micro MySQL) — metadata file.
Cloud CDN — distribusi konten statis.
Cloud Monitoring + Cloud Logging — observabilitas.
Cloud IAM — manajemen akses.

Anggota Kelompok 12
Agatha Monalisa — NIM: 2330105030008 — Role: Security Engineer.
Muhammad Rony Kurniawan — NIM: 2330105030018 — Role: Backend Developer.
Ni Putu Lowryanty — NIM: 2330105030029 — Role: Cloud Architect.
Fatiya Ummu Hanifah Zahra — NIM: 2330205030042 — Role: DevOps Engineer.

Platform Cloud
Google Cloud Platform (GCP) — Region: asia-southeast2 (Jakarta).

Minggu Saat Ini
Minggu 2 —  Implementasi Infrastruktur Dasar.
