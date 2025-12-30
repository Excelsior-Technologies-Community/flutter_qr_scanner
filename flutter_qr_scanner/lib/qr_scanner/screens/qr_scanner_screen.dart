import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/qr_scanner/widgets/qr_scanner_widget.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR')),
      body: QRScannerWidget(
        onScan: (value) {
          Navigator.pop(context, value);
        },
      ),
    );
  }
}
