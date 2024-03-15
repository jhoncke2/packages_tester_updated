import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  File? file;
  @override
  Widget build(BuildContext context) {
    _executePostFrameCallBack();
    return Scaffold(
      body: Center(
        child: file == null?
          const Text('No hay un archivo'):
          Image.file(
            file!,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          )
      ),
    );
  }

  void _executePostFrameCallBack(){
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(file == null){
        final http.Response responseData = await http.get(Uri.https(
          'static1-es.millenium.gg',
          'articles/9/38/13/9/@/179352-dkvmt9svsaa4rhf-article_cover_bd-1.jpg'
        ));
        final uint8list = responseData.bodyBytes;
        var buffer = uint8list.buffer;
        ByteData byteData = ByteData.view(buffer);
        var tempDir = await getTemporaryDirectory();
        file = await File('${tempDir.path}/img').writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)
        );
        setState(() {
          
        });
      }
    });
  }
}