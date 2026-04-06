# Minggu1-Perencanaan-Arsitektur-Kelompok-11

# Cloud Computing Final Project - Profil Perusahaan + Blog Statis

## Deskripsi
Website statis dengan form kontak terintegrasi ke database serverless (DynamoDB) melalui AWS Lambda.  
Dilengkapi CDN (CloudFront), monitoring (CloudWatch), dan backup otomatis.

## Arsitektur Singkat
User → Route53 → CloudFront → S3 (hosting)  
Form → Lambda → DynamoDB  
Monitoring & alarm via CloudWatch

## Anggota Kelompok
- Nama 1 (Cloud Architect)
- Nama 2 (DevOps Engineer)
- Nama 3 (Backend Dev)
- Nama 4 (Security Engineer)

## Layanan AWS Digunakan
S3, CloudFront, Lambda, DynamoDB, CloudWatch, Route53

## Estimasi Biaya
~$1/bulan (free tier dominan)

## Link Diagram Arsitektur
[Lihat Diagram](architecture/diagram.png)

## Link Dokumen Perencanaan
[Dokumen Lengkap](docs/project-planning.md)
