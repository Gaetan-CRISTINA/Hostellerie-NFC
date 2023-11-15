// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:hostellerie/Components/primaryButton.dart';
import 'package:hostellerie/Views/nfc_write.dart';
import '../Models/booking.dart';

class CustomerCard extends StatelessWidget {
  final Booking booking;

  const CustomerCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 7, right: 7),
        child: Card(
          elevation: 0,
          color: booking.nfcCount > 0 ? Color(0xFF96E29E) : Color(0xFFE9E9E9),
          shape: RoundedRectangleBorder(
              //side: BorderSide(color: Color(0xFFC7C7C7)),
              side: BorderSide(
                  color: booking.nfcCount > 0
                      ? Color(0xFF277126)
                      : Color(0xFFC7C7C7)),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SizedBox(
            height: 170,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(booking.room.roomType.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black)),
                        SizedBox(
                          height: 15,
                        ),
                        Text('n° ${booking.bookingId}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black)),
                        SizedBox(
                          height: 25,
                        ),
                        if (booking.nfcCount < 2)
                          PrimaryButton(
                            textButton: 'Create key',
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NfcWriteData(
                                      dataToWrite:
                                          booking.bookingId.toString()),
                                ),
                              );
                            },
                            size: 2,
                          ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          '${booking.nfcCount} Key${booking.nfcCount == 2 ? 's' : ''}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black)),
                      SizedBox(
                        height: 50,
                      ),
                      Text('Room ${booking.room.number.toString()}',
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
      ),
    );
  }
}
