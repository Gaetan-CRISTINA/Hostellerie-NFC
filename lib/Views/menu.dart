
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostellerie/Views/checkin1.dart';
import 'package:hostellerie/Views/create_key1.dart';
import 'package:hostellerie/Views/login.dart';
import 'package:hostellerie/Views/nfc_write.dart';
import 'package:hostellerie/Views/read_key1.dart';
import '../Components/primaryButton.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          primaryButton(
              textButton: 'Check-In', goToWidget: Login(), context: context),
          SizedBox(
            height: 30,
          ),
          primaryButton(textButton: 'Créer clé'),
          SizedBox(
            height: 30,
          ),
          primaryButton(textButton: 'Lire clé'),
          MaterialButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Checkin1(),
                ),
              )
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))),
            textColor: Colors.white,
            color: Color(0xFF4B9BE6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text("Checkin1TEST"),
            ),
          ),
          MaterialButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateKey1(),
                ),
              )
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))),
            textColor: Colors.white,
            color: Color(0xFF4B9BE6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text("CreateKey1TEST"),
            ),
          ),
          MaterialButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadKey1(),
                ),
              )
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))),
            textColor: Colors.white,
            color: Color(0xFF4B9BE6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text("ReadKey1TEST"),
            ),
          ),
        ],
      ),
    );
  }
}
