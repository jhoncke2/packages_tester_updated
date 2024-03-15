// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:packages_tester_updated/packages/qr_scanner/widgets/mobile_scanner_view.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  String? info;
  
  @override
  Widget build(BuildContext context) {
    //return MobileScannerView();
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: ()async{
                var res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpleBarcodeScannerPage(),
                  )
                );
                if(res is String){
                  info = res;
                }else{
                  print('*************');
                  print(res);
                }
              },
              child: const Text(
                'Tomar Qr'
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              info ?? 'No hay info leída'
            )
          ]
        ),
      ),
    );
  }
}