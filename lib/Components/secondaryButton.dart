import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String textButton;
  final VoidCallback action;
  final int size;
  const SecondaryButton({super.key, required this.textButton, required this.action, required this.size});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: action,
      shape: RoundedRectangleBorder(
         side: BorderSide(color: Color(0xFFe6b34b)),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      textColor: Color(0xFFe6b34b),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text(textButton),
      ),
    );
  }
}
