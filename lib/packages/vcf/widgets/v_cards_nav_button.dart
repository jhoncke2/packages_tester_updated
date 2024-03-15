import 'package:flutter/material.dart';
class VCardsNavButton extends StatelessWidget {
  final Function() onPressed;
  final bool isSelected;
  final String text;
  const VCardsNavButton({
    Key? key,
    required this.onPressed,  
    required this.isSelected,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isSelected?
        Colors.blueGrey[500]:
        Colors.blueGrey[50],
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isSelected?
            Colors.white:
            Colors.black
        )
      )
    );
  }
}