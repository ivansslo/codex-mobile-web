# Codex Mobile Web

## Gambaran Umum

Codex Mobile Web adalah klien web lokal untuk skema ponsel, tablet, dan AI Home tersemat. 
Ini adalah klien Codex app-server lokal yang ditujukan untuk ponsel, tablet, dan skenario 
plugin AI Home tersemat.

## Instalasi

### Prasyarat
- Node.js versi 22 atau lebih tinggi
- npm atau yarn
- Akun Cloudflare (untuk deployment)

### Langkah Instalasi

1. **Kloning repository**:
   ```bash
   git clone https://github.com/devel/codex-mobile-web.git
   cd codex-mobile-web
   ```

2. **Instal dependensi**:
   ```bash
   npm install
   ```

3. **Jalankan server**:
   ```bash
   npm start
   ```

4. **Akses aplikasi**:
   Buka browser dan akses `http://localhost:3000` (atau sesuaikan dengan port yang digunakan)

## Deployment Cloudflare

### Menggunakan Cloudflare Worker

1. **Instal Wrangler CLI**:
   ```bash
   npm install -g wrangler
   ```

2. **Login ke Cloudflare**:
   ```bash
   wrangler login
   ```

3. **Konfigurasi**:
   - Edit `wrangler.toml` dan ganti `account_id` dengan ID akun Cloudflare Anda
   - Sesuaikan `pattern` dan `custom_domain` jika diperlukan

4. **Deploy**:
   ```bash
   wrangler deploy
   ```

### Development Mode
```bash
wrangler dev
```

## Fitur Utama

- Melihat dan mengirim pesan di thread Codex
- Mengunggah gambar dan file
- Mengamati status command/tool secara real-time
- Kolaborasi kartu tugas lintas-thread
- Menjalankan Home AI embedded iframe
- Notifikasi Web Push/Action Inbox
- Sinkronisasi real-time dengan Codex Desktop

## Dokumentasi

- [Panduan Deployment Cloudflare](DEPLOY_CF.md)
- [Arsitektur](docs/ARCHITECTURE.md)

## Kontributor

Proyek ini dikembangkan oleh tim Codex dan komunitasnya.

## Lisensi

MIT License
