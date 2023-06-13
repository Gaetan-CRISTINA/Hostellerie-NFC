// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:hostellerie/Components/secondaryButton.dart';
import 'package:hostellerie/Methods/bookings_methods.dart';
import 'package:hostellerie/Models/booking.dart';
import 'package:hostellerie/Views/nfc_write.dart';
import 'package:hostellerie/main.dart';

class ConfirmCreatedCard extends StatefulWidget {
  final String dataToWrite;
  const ConfirmCreatedCard({super.key, required this.dataToWrite});

  @override
  State<ConfirmCreatedCard> createState() => _ConfirmCreatedCard();
}

class _ConfirmCreatedCard extends State<ConfirmCreatedCard> {
  late Future<Booking> futureResult;

  @override
  void initState() {
    super.initState();
    futureResult = fetchBookingById(widget.dataToWrite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Check-in Customer key creator',
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
                FutureBuilder<Booking>(
                  future: futureResult,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.nfcCount < 2)
                        return Column(
                          children: [
                            SecondaryButton(
                                textButton: 'Create another key',
                                action: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NfcWriteData(
                                          dataToWrite: widget.dataToWrite),
                                    ),
                                  );
                                },
                                size: 1),
                            SecondaryButton(
                                textButton: 'Return Home',
                                action: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                                size: 2),
                          ],
                        );
                    }
                    return Column(
                      children: [
                        Text('2 cards already created'),
                        SizedBox(height: 20),
                        SecondaryButton(
                            textButton: 'Return Home',
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            },
                            size: 1),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
