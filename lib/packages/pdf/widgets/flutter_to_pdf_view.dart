import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/export_delegate.dart';
import 'package:flutter_to_pdf/export_frame.dart';
import 'package:packages_tester_updated/packages/pdf/widgets/test_widget_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FlutterToPdfView extends StatelessWidget {
  static const _widgetToPdfId = 'widget_to_pdf';
  final ExportDelegate exportDelegate = ExportDelegate();
  FlutterToPdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: ()async{
                  final pdf = await exportDelegate.exportToPdfDocument(_widgetToPdfId);
                  final bytes = await pdf.save();
                  final dir = await getTemporaryDirectory();
                  final file = File("${dir.path}/pdf.pdf");
                  await file.writeAsBytes(bytes);
                  final files = <XFile>[
                    XFile(
                      file.path,
                      name: 'pdf-test.pdf'
                    )
                  ];
                  await Share.shareXFiles(
                    files,
                    text: 'test widgets pdf',
                    subject: ''
                  );
                },
                child: const Text(
                  'Generar Pdf Widget'
                ),
              ),
              ExportFrame(
                frameId: _widgetToPdfId,
                exportDelegate: exportDelegate,
                child: const CardDetail()
              )
            ]
          ),
        )
      )
    );
  }
}