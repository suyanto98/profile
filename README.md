# suyantolabs.my.id

Halaman profil statis (HTML + CSS, tanpa build step) untuk [LedgerPay](https://ledgerpay.suyantolabs.my.id) dan [PayRun](https://payrun.suyantolabs.my.id).

Dilayani Caddy yang sama dengan kedua aplikasi (satu VM): `profile.caddy` dipasang di `/srv/edge/sites/`, isi `site/` di `/srv/edge/sites/profile/`.

```bash
./deploy.sh <host>   # upload + caddy reload
```
