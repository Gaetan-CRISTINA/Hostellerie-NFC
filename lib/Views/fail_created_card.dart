// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class FailCreatedCard extends StatelessWidget {
  const FailCreatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Key',
        ),
        backgroundColor: Color(0xFFe6b34b),
      ),
      body: Container(child: Text('Too many card')),
    );
  }
}