// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostellerie/Providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../Methods/bookings_methods.dart';
import 'nfc_write.dart';

class ConfirmCheckin extends StatelessWidget {
  final String dataToWrite;
  const ConfirmCheckin({super.key, required this.dataToWrite});

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
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 0),
                child: Text(
                  'Check-in Confirmed',
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
                      image: AssetImage("images/checked.png"),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => {
                  updateBooking(dataToWrite,Provider.of<AuthProvider>(context, listen: false).sharedPrefRepository.token),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NfcWriteData(dataToWrite: dataToWrite),
                    ),
                  ),
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                textColor: Colors.white,
                color: Color(0xFFe6b34b),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text("Create Room Key"),
                ),
              ),
            
            ],
          ),
        ));
  }
}
