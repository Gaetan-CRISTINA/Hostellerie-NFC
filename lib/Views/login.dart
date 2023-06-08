import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hostellerie/Components/secondaryButton.dart';
import '../Components/primaryButton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: 400,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/logo.png"),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
              EdgeInsets.only(top: 20, left: 50.0, right: 50.0),
              child: Divider(
                color: Color(0xFFe6b34b),
                height: 8,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Name',
                  hintText: 'Enter Your Name'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: primaryButton(
                textButton: 'Login',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Forgot your password ?',
                style: TextStyle(
                  color: Color(0xFF6200EF),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: secondaryButton(
                textButton: 'Cancel',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
