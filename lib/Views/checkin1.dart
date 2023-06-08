// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostellerie/Views/qr_code.dart';

class Checkin1 extends StatelessWidget {
  const Checkin1({super.key});

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
      body: QRcodeReader(),
    );
  }
}
