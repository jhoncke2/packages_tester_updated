// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:packages_tester_updated/packages/pdf/widgets/flutter_to_pdf_view.dart';
import 'package:packages_tester_updated/packages/pdf/widgets/pdf_widgets_view.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPage extends StatefulWidget {

  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  late pw.Document pdf;
  @override
  void initState() {
    pdf = pw.Document();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PdfWidgetsView()
              )),
              color: Colors.blueAccent,
              child: Text(
                'Pdf Widgets',
                style: TextStyle(
                  color: Colors.white
                )
              )
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => FlutterToPdfView()
              )),
              color: Colors.amber[700],
              child: Text(
                'Flutter To Pdf',
                style: TextStyle(
                  color: Colors.white
                )
              )
            ),
          ]
        )
      )
    );
  }

  
}