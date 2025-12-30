import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_qr_scanner/flutter_qr_scanner.dart';

void main() {
  testWidgets('QRScannerWidget loads', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QRScannerWidget(
            onScan: (value) {},
          ),
        ),
      ),
    );

    // Widget present
    expect(find.byType(QRScannerWidget), findsOneWidget);

    // Flash & camera icons present
    expect(find.byIcon(Icons.flash_on), findsOneWidget);
    expect(find.byIcon(Icons.cameraswitch), findsOneWidget);
  });
}
