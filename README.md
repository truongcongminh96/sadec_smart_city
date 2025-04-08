# Sa Đéc SmartCity App

A modern mobile application built with Flutter to support citizens of Sa Đéc city in connecting with
local government services, public utilities, and urban features in a smart and convenient way.

---

## 📱 Features

- 🧭 **Home Dashboard** with quick access to core features
- 📝 **Report Issues** directly to the authorities with images and location
- 🏥 **Find medical services** from hospitals to pharmacies
- 🗺️ **Interactive Map** to find schools, public offices, and points of interest
- 🚛 **Trash collection schedule**
- 🌤️ **Weather updates**
- 📢 **Receive notifications and announcements** from the city
- 🧑‍💼 **Job portal & government services access**

---

## 🛠️ Tech Stack

- **Flutter** (null safety, Dart 3+)
- **go_router** for navigation
- **get_it** for dependency injection
- **flutter_bloc** for state management
- **dio** for networking
- **google_fonts** with Sora font
- **SharedPreferences** for local storage

---

## 📁 Project Structure

```
lib/
├── core/               # Theme, router, injector, constants...
├── features/           # Feature-first folder structure
│   ├── home/
│   ├── report_issue/
│   ├── map/
│   └── ...
├── shared/             # Reusable widgets and layouts
├── app.dart            # App widget + MaterialApp.router config
└── main.dart           # Entry point
```

---

## 🚀 Getting Started

### 1. Install dependencies:

```bash
flutter pub get
```

### 2. Run app:

```bash
flutter run
```

### 3. Build APK:

#Set true when running on real devices

```bash
<meta-data
            android:name="io.flutter.embedding.android.EnableImpeller"
            android:value="false" />
```

```bash
flutter build apk
```

---

## 🎨 Design Language

- Font: [Sora](https://fonts.google.com/specimen/Sora)
- Primary color: Green (`#4CAF50`) for modern & government vibes
- UI design follows neumorphic + modern flat style

---

## 🤝 Contribution

Pull requests are welcome! For major changes, please open an issue first to discuss what you would
like to change.

---

## 📄 License

MIT License © 2025 VNPT-DTP Team
