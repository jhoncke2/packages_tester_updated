import 'package:flutter/material.dart';
import 'package:packages_tester_updated/globals/app_dimens.dart';
class EmaoilSenderDialog extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController subject;
  final TextEditingController body;
  const EmaoilSenderDialog({
    Key? key,
    required this.email,
    required this.subject,
    required this.body
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          SizedBox(
            width: AppDimens.widthPercentage(0.5, context),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            )
          ),
          SizedBox(
            width: AppDimens.widthPercentage(0.5, context),
            child: TextField(
              controller: subject,
              decoration: const InputDecoration(
                hintText: 'Asunto'
              ),
            )
          ),
          SizedBox(
            width: AppDimens.widthPercentage(0.5, context),
            child: TextField(
              controller: body,
              decoration: const InputDecoration(
                hintText: 'Mensaje'
              ),
            )
          ),
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            color: Colors.blueAccent,
            child: const Text(
              'Enviar',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ]
      )
    );
  }
}