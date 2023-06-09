// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

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
    return Container(child:Text('test'));
  }
}


