// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hostellerie/Components/secondaryButton.dart';

import 'Components/primaryButton.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'NFT POWER';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      title: _title,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User Agent App',
        ),
        backgroundColor: Color(0xFFe6b34b),
      ),
      body: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Container(
        color: Colors.white,
        child: PageView(
          controller: controller,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, left: 50.0, right: 50.0),
                  child: Divider(
                    color: Color(0xFFe6b34b),
                    height: 8,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: primaryButton(
                    textButton: 'Login',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Forgot your password ?',
                    style: TextStyle(
                      color: Color(0xFF6200EF),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: secondaryButton(
                    textButton: 'Cancel',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
