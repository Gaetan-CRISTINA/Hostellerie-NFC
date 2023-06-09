// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostellerie/Components/secondaryButton.dart';

class ConfirmCreatedCard extends StatelessWidget {
  const ConfirmCreatedCard({super.key});

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
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 0),
                  child: Text(
                    'Create Key',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/circularValidate.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text('Key created'),
                SizedBox(height: 50),
                secondaryButton(textButton: 'Create another key')
              ],
            ),
          ),
        ));
  }
}
