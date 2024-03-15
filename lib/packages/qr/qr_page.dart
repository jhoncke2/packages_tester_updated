import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrPage extends StatelessWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrCode = QrCode(4, QrErrorCorrectLevel.L);
    qrCode.addData('Hello, wold in QR format');
    return Scaffold(
      body: Center(
        child: QrImageView(
          data: 'https://gapfergon.com',
          size: 200
        )
      )
    );
  }
}