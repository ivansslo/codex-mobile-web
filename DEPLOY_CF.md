# Panduan Deployment Cloudflare

## Prasyarat

1. Akun Cloudflare
2. Wrangler CLI yang terinstal
3. Project telah di-clone

## Langkah-langkah Deployment

### 1. Login ke Cloudflare
```bash
wrangler login
```

### 2. Konfigurasi Wrangler
Edit file `wrangler.toml`:
- Ganti `account_id` dengan ID akun Cloudflare Anda
- Sesuaikan nama worker jika diperlukan

### 3. Setup KV Store
```bash
# Buat KV store untuk session
wrangler kv:namespace create SESSION_STORE
```

### 4. Deploy
```bash
# Development
wrangler dev

# Production
wrangler deploy
```

## Konfigurasi Tambahan

### Environment Variables
Buat file `.dev.vars`:
```
CODEX_MOBILE_HOST=0.0.0.0
CODEX_MOBILE_PORT=8787
ENVIRONMENT=development
```

### Custom Domain
1. Masuk ke Cloudflare Dashboard
2. Pilih Worker yang telah deploy
3. Tambahkan custom domain
4. Konfigurasi DNS sesuai petunjuk

## Troubleshooting

- Pastikan ID akun Cloudflare benar
- Periksa permissions untuk KV Store
- Cek logs dengan `wrangler tail`
