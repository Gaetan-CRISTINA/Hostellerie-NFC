// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NFCWrapperView extends StatelessWidget {
  const NFCWrapperView({
    super.key,
    required bool isScanning,
  }) : _isScanning = isScanning;

  final bool _isScanning;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: _isScanning ? Colors.green[100] : Colors.amber[100],
          shape: BoxShape.circle,
        ),
        child: Container(
            width: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Image.asset("images/nfc.png")])));
  }
}
