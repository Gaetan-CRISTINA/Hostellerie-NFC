// ignore_for_file: prefer_const_constructors, implementation_imports, avoid_unnecessary_containers, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class Checkin2 extends StatelessWidget {
  final String result;
  const Checkin2({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Check-in Customer',
          ),
          backgroundColor: Color(0xFFe6b34b),
        ),
        body: CheckinSecondPart(result: result));
  }
}

class CheckinSecondPart extends StatelessWidget {
  final String result;
  const CheckinSecondPart({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(child: 
    Center(
      child: 
      Text('String Content : $result')));
  }
}
