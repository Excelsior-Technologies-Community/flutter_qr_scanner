# QrScanner

A simple and easy-to-use QR Code Scanner package for Flutter built using

This package provides:
* 📷 QR scanner screen
* 🔦 Flash ON / OFF
* 🔁 Camera switch (front/back)
* 🎯 Scan only once (no duplicate scan)
* 🧩 Easy integration in any Flutter project

---

## ✨ Features
* Scan QR codes easily
* Flashlight toggle button
* Camera flip button
* Overlay scan box
* Clean & simple UI
* Beginner friendly code
---

## ✨ Preview

![screen-20251230-1522502 (1)](https://github.com/user-attachments/assets/da0fea30-cf90-4669-a5e1-2f57f12c7228)

---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_qr_scanner:
    path: ../flutter_qr_scanner  # For local development
```
from git:
```
dependencies:
  flutter_qr_scanner:
    git:
      url: https://github.com/yourusername/flutter_qr_scanner.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---
## 📁Project Structure
```
lib/
 ├── flutter_qr_scanner.dart
 └── qr_scanner/
     ├── screens/
     │   ├── home_screen.dart
     │   └── qr_scanner_screen.dart
     └── widgets/
         ├── qr_scanner_widget.dart
         └── qr_overlay.dart

```
## 🧩 Widget Breakdown
#### 📄 QRScannerScreen
* Full screen scanner
* Handles navigation & result return
### 📦 QRScannerWidget
* Camera preview
* QR detection logic
* Flash & camera switch buttons
### 🟩 QROverlay
* Scan area box
* Easy to customize size & color
---
## 🔐 Android Permission
Add camera permission in:
android/app/src/main/AndroidManifest.xml
```
<uses-permission android:name="android.permission.CAMERA"/>
```
---
## 🎨 Customization
You can easily customize:
* Overlay size & color
* Button position
* Flash icon
* Camera switch icon
* Scan once / continuous scan
## 🚀 Usage (Quick Start)
#### 1️⃣ Import package
```
import 'package:flutter_qr_scanner/flutter_qr_scanner.dart';

```
## 2️⃣ Open QR Scanner Screen
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => QRScannerScreen(
      onScan: (value) {
        print(value);
        Navigator.pop(context);
      },
    ),
  ),
);
```

## 🧪 Full Example
```
import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/flutter_qr_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = 'No QR scanned';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Scan QR'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QRScannerScreen(
                      onScan: (value) {
                        setState(() {
                          result = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```
---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---
