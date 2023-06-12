// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:hostellerie/Models/booking.dart';
import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  // final String gender;
  const BookingCard({super.key, required this.booking});

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
          height: 340,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text('Réservation n°  ${booking.bookingId}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black)),
                      Text('Chambre : ${booking.room.roomType.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black)),
                      Text(' n° :${booking.room.number.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                              ' ${booking.user.gender == 'female' ? 'Madame ' : 'Monsieur '}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                          Text(
                              '${booking.user.lastname.toUpperCase()} ${booking.user.firstname}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Nombre de clients : ${booking.occupants}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'Du ${DateFormat('dd/MM/yyyy').format(booking.startingDate)} Au ${DateFormat('dd/MM/yyyy').format(booking.endingDate)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                          Text(
                              ' soit ${booking.endingDate.difference(booking.startingDate).inDays} nuits',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Options :',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black)),
                      for (var option in booking.options)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(option.name.fr),
                          ],
                        ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
