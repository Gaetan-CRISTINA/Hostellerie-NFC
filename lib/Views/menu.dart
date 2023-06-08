import 'package:flutter/cupertino.dart';
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
          SizedBox(height: 30,),
          primaryButton(textButton: 'Check-In'),
          SizedBox(height: 30,),
          primaryButton(textButton: 'Créer clé'),
          SizedBox(height: 30,),
          primaryButton(textButton: 'Lire clé'),
        ],

      ),
    );
  }
}
