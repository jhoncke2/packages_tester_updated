import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart' as html_pdf;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

class PdfWidgetsView extends StatefulWidget {
  const PdfWidgetsView({Key? key}) : super(key: key);

  @override
  State<PdfWidgetsView> createState() => _PdfWidgetsViewState();
}

class _PdfWidgetsViewState extends State<PdfWidgetsView> {
  late int _pageIndex;
  late pw.Document pdf;
  @override
  void initState() {
    _pageIndex = 0;
    pdf = pw.Document();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () => _addPage(screenWidth),
            color: Colors.blueAccent,
            child: const Text(
              'Agregar Página',
              style: TextStyle(
                color: Colors.white
              )
            )
          ),
          MaterialButton(
            onPressed: _addHtml,
            color: Colors.amber[700],
            child: const Text(
              'Agregar Html',
              style: TextStyle(
                color: Colors.white
              )
            )
          ),
          MaterialButton(
            onPressed: _generatePdf,
            color: Colors.redAccent,
            child: const Text(
              'Generar Pdf',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),
        ],
      ),
    );
  }

  void _addPage(double screenWidth){
    const format = html_pdf.PdfPageFormat.a4;
    pdf.addPage(pw.Page(
      pageFormat: format,
      build: (pdfContext) => pw.Container(
        width: format.width * 0.8,
        height: format.height * 0.3,
        decoration: pw.BoxDecoration(
          color: const html_pdf.PdfColor(0.4, 0.6, 0.4),
          borderRadius: pw.BorderRadius.circular(
            50
          )
        ),
        child: pw.Center(
          child: pw.Text(
            'Página $_pageIndex',
            style: const pw.TextStyle(
              color: PdfColor(0.9, 0.9, 0.9)
            )
          )
        )
      )
    ));
    pdf.addPage(pw.Page(
      pageFormat: format,
      build: (pdfContext) => pw.Container(
        width: format.width * 0.8,
        height: format.height * 0.3,
        decoration: pw.BoxDecoration(
          color: const PdfColor(0.1, 0.2, 0.5),
          borderRadius: pw.BorderRadius.circular(
            50
          ),
          boxShadow: const [
            pw.BoxShadow(
              color: PdfColor(0.85, 0.85, 0.85),
              offset: PdfPoint(1, 3),
              blurRadius: 3,
              spreadRadius: 1
            )
          ]
        ),
        child: pw.Center(
          child: pw.Text(
            'Otra página $_pageIndex',
            style: const pw.TextStyle(
              color: PdfColor(0.9, 0.9, 0.9)
            )
          )
        )
      )
    ));
    _pageIndex++;
  }

  Future<void> _addHtml()async{
    const html = '''
<h1> Title </h1>
<p> This is a paragraph </p>
<span> This is a span </span>
''';
    final widgets = await html_pdf.HTMLToPdf().convert(html);
    pdf.addPage(html_pdf.MultiPage(
      maxPages: 200,
      pageFormat: PdfPageFormat.a4,
      build: (_) => widgets
    ));
  }

  Future<void> _generatePdf()async{
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    await Directory('${appDocDirectory.path}/dir').create(recursive: true)
    // The created directory is returned as a Future.
      .then((Directory directory)async{
        final file = File('${directory.path}/example.pdf');
        await file.writeAsBytes(await pdf.save());
        final xFiles = [
          XFile(file.path)
        ];
        await Share.shareXFiles(
          xFiles,
          text: 'Mira mi pdf',
          subject: 'Lo que sea'
        );
      }
    );
  }
}