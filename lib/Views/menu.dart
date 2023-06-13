// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostellerie/Views/checkin1.dart';
import 'package:hostellerie/Views/create_key1.dart';
import 'package:hostellerie/Views/key_erase.dart';
import 'package:hostellerie/Views/read_key1.dart';
import '../Components/primaryButton.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(
                width: 300,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/logo2.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(
              textButton: 'Check-In',
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Checkin1(),
                  ),
                );
              },
              size: 1,
            ),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(
              textButton: 'Créer clé',
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateKey1(),
                  ),
                );
              },
              size: 1,
            ),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(
              textButton: 'Lire clé',
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadKey1(),
                  ),
                );
              },
              size: 1,
            ),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(
              textButton: 'Effacer clé',
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NfcEraseData(),
                  ),
                );
              },
              size: 1,
            ),
          ],
        ),
      ),
    );
  }
}
