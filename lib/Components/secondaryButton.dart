// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class secondaryButton extends StatelessWidget {
  final String textButton;
  const secondaryButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => {print("login")},
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
