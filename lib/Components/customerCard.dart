// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import '../Views/create_key2.dart';

class customerCard extends StatelessWidget {
  const customerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Color(0xFFE9E9E9),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFC7C7C7)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SizedBox(
          height: 170,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left:20, top: 10),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('Premium room',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black)),
                      SizedBox(
                        height: 15,
                      ),
                      Text('n° 564654695',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black)),
                      SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateKey2(),
                            ),
                          )
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35))),
                        textColor: Colors.white,
                        color: Color(0xFFe6b34b),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Text('Create key'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('0 Key',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black)),
                    SizedBox(
                      height: 50,
                    ),
                    Text('Room 202',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
