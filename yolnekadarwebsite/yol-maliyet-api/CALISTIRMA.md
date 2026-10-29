# Yol Maliyet API – Çalıştırma Kılavuzu

## 1. Bağımlılıkları Yükle

```bash
npm install
```

## 2. Ortam Değişkenleri (.env)

`.env` dosyasında şunlar olmalı:

| Değişken | Açıklama | Varsayılan |
|----------|----------|------------|
| `PORT` | Sunucu portu | `3000` |
| `NODE_ENV` | Ortam | `development` |
| `GOOGLE_API_KEY` | Google Directions API anahtarı | — |

## 3. Sunucuyu Başlat

```bash
npm run dev
```

Konsolda aşağıdaki çıktı görünecektir:
```
╔══════════════════════════════════════════════╗
║   🚗 Yol Ücreti Hesaplama API               ║
║   Port: 3000                                 ║
║   API: http://localhost:3000/api/calculate   ║
╚══════════════════════════════════════════════╝
```

## 4. API Kullanımı

### POST /api/calculate

**Request:**
```json
{
  "from": "Istanbul",
  "to": "Ankara",
  "vehicleType": "car"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "route": "İstanbul → Ankara",
    "vehicleType": "car",
    "distanceKm": 453.2,
    "durationMin": 290,
    "tolls": [
      { "name": "15 Temmuz Şehitler Köprüsü", "price": 18.9 },
      { "name": "İstanbul - Kocaeli Otoyolu", "price": 22.5 },
      { "name": "Bolu Dağı Tüneli", "price": 24.0 },
      { "name": "İstanbul - Ankara Otoyolu", "price": 129.75 }
    ],
    "totalCost": 195.15
  }
}
```

### GET /api/health

Sunucunun çalışıp çalışmadığını kontrol eder.

## 5. PowerShell Test

```powershell
# Başarılı istek
Invoke-RestMethod -Method Post -Uri "http://localhost:3000/api/calculate" `
  -ContentType "application/json" `
  -Body '{"from":"Istanbul","to":"Ankara","vehicleType":"car"}'

# Health check
Invoke-RestMethod -Uri "http://localhost:3000/api/health"
```

## 6. Desteklenen Araç Tipleri

| Tip | Açıklama |
|-----|----------|
| `car` | Otomobil |
| `truck` | Kamyon / TIR |
| `bus` | Otobüs |
| `motorcycle` | Motosiklet |

## 7. Desteklenen Güzergahlar

- İstanbul ↔ Ankara
- İstanbul ↔ İzmir
- İstanbul ↔ Bursa
- İstanbul ↔ Edirne
- İstanbul ↔ Antalya
- İstanbul ↔ Çanakkale
- İstanbul ↔ Kocaeli
- İstanbul ↔ Trabzon
- İstanbul ↔ Eskişehir
- Ankara ↔ İzmir
- Ankara ↔ Adana
- Ankara ↔ Eskişehir
- Ankara ↔ Konya
- Ankara ↔ Gaziantep
- Adana ↔ Mersin
