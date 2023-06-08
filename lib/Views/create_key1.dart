import 'package:flutter/material.dart';
import '../Components/customerCard.dart';

class CreateKey1 extends StatelessWidget {
  const CreateKey1({super.key});

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