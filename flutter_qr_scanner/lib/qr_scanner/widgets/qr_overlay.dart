import 'package:flutter/material.dart';

class QROverlay extends StatelessWidget {
  const QROverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),

      ),
    );
  }
}
