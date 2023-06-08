// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class primaryButton extends StatelessWidget {
  final String textButton;
  final Widget? goToWidget;
  final BuildContext? context;

  const primaryButton({super.key, required this.textButton, this.goToWidget,this.context});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => goToWidget!,
          ),
        )
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(35))),
      textColor: Colors.white,
      color: Color(0xFFe6b34b),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text(textButton),
      ),
    );
  }
}
