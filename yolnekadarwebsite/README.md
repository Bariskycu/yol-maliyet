# 🚗 Yol Ne Kadar? - Otoyol ve Yakıt Maliyeti Hesaplayıcı

Yol Ne Kadar, Türkiye'deki ücretli otoyol, köprü ve tünel geçiş ücretlerini ve araç yakıt maliyetini hesaplayan modern bir web uygulamasıdır. Kullanıcıların seyahat rotalarını planlarken "En Hızlı", "En Ucuz" ve "Alternatif" rotaları kıyaslayarak bütçelerine ve zamanlarına en uygun seçimi yapmalarını sağlar.

## 🌟 Özellikler
- **Gerçek Zamanlı Rota Hesaplama:** Google Routes API entegrasyonu ile en güncel rotalar.
- **Detaylı Maliyet Analizi:** Gişe ücretleri (KGM, Yap-İşlet-Devret) ve yakıt tüketimi (benzin, motorin vb.) dahil toplam maliyet.
- **Alternatif Rota Sunumu:** Kullanıcılara paralı otoyollar ve parasız (Toll-free) alternatifleri yan yana karşılaştırma imkanı.
- **Dinamik Harita Gösterimi:** Seçilen rotanın harita üzerinde renkli ve etkileşimli çizimi.
- **Modern Arayüz (UI/UX):** Vite + React ile geliştirilmiş, akıcı animasyonlara sahip, karanlık mod (dark theme) ve glassmorphism tabanlı responsive tasarım.

## 🛠️ Teknolojiler
- **Frontend:** React, Vite, Vanilla CSS, Google Maps React Wrapper
- **Backend:** Node.js, Express.js, Axios
- **API:** Google Maps Directions API & Routes API v2

## 🚀 Kurulum ve Çalıştırma

Proje **backend** (yol-maliyet-api) ve **frontend** (yol-maliyetfrontend) olmak üzere iki klasörden oluşur. 

### 1. Backend API Kurulumu
```bash
cd yol-maliyet-api
npm install
```
* **Ayar:** `.env.example` dosyasını kopyalayıp `.env` adında yeni bir dosya oluşturun ve içine kendi `GOOGLE_API_KEY` bilginizi girin.
```bash
npm run dev
```
*(Backend varsayılan olarak `http://localhost:3000` portunda çalışacaktır).*

### 2. Frontend Kurulumu
```bash
cd ../yol-maliyetfrontend
npm install
```
* **Ayar:** Kök dizindeki `.env` dosyasındaki `VITE_GOOGLE_MAPS_API_KEY` alanına kendi anahtarınızı girin.
```bash
npm run dev
```

## 📸 Ekran Görüntüleri
*(Uygulamanın arayüzüne ait ekran görüntülerini buraya yükleyebilirsiniz)*

## 📄 Lisans
Bu proje geliştirilmeye açık ve MIT lisansına sahiptir.
