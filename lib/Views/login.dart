// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'package:hostellerie/Providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../Components/secondaryButton.dart';
import 'package:flutter/material.dart';
import '../Components/primaryButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
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
            padding: EdgeInsets.only(top: 20, left: 50.0, right: 50.0),
            child: Divider(
              color: Color(0xFFe6b34b),
              height: 8,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter email',
                  hintText: ''),
            ),
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Password',
                  hintText: ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PrimaryButton(
              textButton: 'Login',
              action: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .loginUser(email: email, password: password);
              },
              size: 1,
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
        ],
      ),
    ]));
  }
}
