// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../Components/customerCard.dart';

class CreateKey1 extends StatelessWidget {
  const CreateKey1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Room Key',
        ),
        backgroundColor: Color(0xFFe6b34b),
      ),
      body: CreateFirstPart(),
    );
  }
}

class CreateFirstPart extends StatelessWidget {
  const CreateFirstPart({super.key});

 @override
    Widget build(BuildContext context) {
      return Center(
        child: Container(
        color: Colors.white,
          child: const Column(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: customerCard(),
              ),
            ],
          ),
        ),
      );
    }
  }