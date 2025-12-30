import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'qr_overlay.dart';

class QRScannerWidget extends StatefulWidget {
  final Function(String) onScan;

  const QRScannerWidget({super.key, required this.onScan});

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  late final MobileScannerController controller;

  bool isScanned = false;
  bool isTorchOn = false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleFlash() {
    controller.toggleTorch();
    setState(() {
      isTorchOn = !isTorchOn;
    });
  }

  void switchCamera() {
    controller.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          onDetect: (capture) {
            if (isScanned) return;

            final barcode = capture.barcodes.first;
            final String? code = barcode.rawValue;

            if (code == null) return;

            isScanned = true;
            controller.stop();
            widget.onScan(code);
          },
        ),

        const QROverlay(),

        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: Icon(isTorchOn ? Icons.flash_off : Icons.flash_on),
                  onPressed: toggleFlash,
                ),
              ),

              const SizedBox(width: 30),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: const Icon(Icons.cameraswitch),
                  onPressed: switchCamera,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
