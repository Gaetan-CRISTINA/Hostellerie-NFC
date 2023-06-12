import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  final VoidCallback action;
  final int size;
  const PrimaryButton({super.key, required this.textButton, required this.action, required this.size});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: action,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(35))),
      textColor: Colors.white,
      color: Color(0xFFe6b34b),
      child: Padding(
        padding: size == 1 ? const EdgeInsets.symmetric(horizontal: 50, vertical: 20) : const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(textButton),
      ),
    );
  }
}
