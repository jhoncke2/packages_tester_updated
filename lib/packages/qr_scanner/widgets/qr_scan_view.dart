import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScanView extends StatefulWidget {
  const QrScanView({Key? key}) : super(key: key);

  @override
  State<QrScanView> createState() => _QrScanViewState();
}

class _QrScanViewState extends State<QrScanView> {
  String? qrCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: ()async{
                var status = await Permission.camera.request();
                if(status == PermissionStatus.granted){
                  final cameraScanResult = await scanner.scan();
                  setState(() {
                    qrCode = cameraScanResult;
                  });
                }else{
                  showDialog(
                    context: context,
                    builder: (_) => const Dialog(
                      child: Center(
                        child: Text('Sin permisos de cámara')
                      )
                    )
                  );
                }
              },
              child: const Text(
                'Escanear QR'
              )
            ),
            const SizedBox(
              height: 20
            ),
            Visibility(
              visible: qrCode != null,
              child: Text(
                qrCode ?? ''
              )
            )
          ]
        )
      )
    );
  }
}