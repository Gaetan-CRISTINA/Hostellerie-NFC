// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hostellerie/Providers/AuthProvider.dart';
import 'package:hostellerie/Views/login.dart';
import 'package:provider/provider.dart';
import 'Views/menu.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => AuthProvider(), child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Hostellerie Asteracee';

  Widget loader(Status status) {
    switch (status) {
      case Status.LoggedIn:
        {
          return Menu();
        }
      case Status.Loading:
        {
          return Center(child: CircularProgressIndicator());
        }
      default:
        {
          return Login();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return loader(authProvider.loggedInStatus);
      }),
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
      body: const Menu(),
    );
  }
}
