// ignore_for_file: prefer_const_constructors, implementation_imports, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:hostellerie/Components/bookingCard.dart';
import 'package:hostellerie/Views/confirm_checking.dart';
import 'package:provider/provider.dart';

import '../Methods/bookings_methods.dart';
import '../Models/booking.dart';
import '../Providers/AuthProvider.dart';

class Checkin2 extends StatefulWidget {
  final String bookingId;
  const Checkin2({super.key, required this.bookingId});

  @override
  State<Checkin2> createState() => _Checkin2();
}

class _Checkin2 extends State<Checkin2> {
  late Future<Booking> futurBooking;
  String? dataToWrite;
  Booking? booking;

  @override
  void initState() {
    super.initState();
    futurBooking = fetchBookingById(widget.bookingId,Provider.of<AuthProvider>(context, listen: false).sharedPrefRepository.token);
  }

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
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Informations de la réservation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              FutureBuilder<Booking>(
                future: futurBooking,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    dataToWrite = snapshot.data!.bookingId.toString();
                    booking = snapshot.data;
                    // return Text(snapshot.data!.bookingId.toString());
                    return BookingCard(booking: booking!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () => {
                  updateBooking(dataToWrite!,Provider.of<AuthProvider>(context, listen: false).sharedPrefRepository.token),
                  if (dataToWrite != null)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ConfirmCheckin(dataToWrite: dataToWrite ?? ''),
                      ),
                    ),
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                textColor: Colors.white,
                color: Color(0xFFe6b34b),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Text("Confirmed check-in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
