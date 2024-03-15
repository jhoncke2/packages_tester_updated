import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:packages_tester_updated/packages/email_sender/email_sender_dialog.dart';
class EmailSenderPage extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _body = TextEditingController();
  EmailSenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: ()async{
            await showDialog(
              context: context,
              builder: (_) => EmaoilSenderDialog(
                email: _email,
                subject: _subject,
                body: _body
              )
            );
            if(_email.text.isNotEmpty && _subject.text.isNotEmpty && _body.text.isNotEmpty){
              await FlutterEmailSender.send(Email(
                subject: _subject.text,
                body: _body.text,
                recipients: [_email.text]
              ));
            }
          },
          color: Colors.green,
          child: const Text(
            'Enviar Mensaje',
            style: TextStyle(
              color: Colors.white
            )
          )
        )
      )
    );
  }
}