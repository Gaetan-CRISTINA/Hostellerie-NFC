// ignore_for_file: prefer_const_constructors, implementation_imports, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';

import '../Methods/bookings_methods.dart';
import '../Models/booking.dart';
import 'nfc_write.dart';

class Checkin2 extends StatefulWidget {
  final String bookingId;
  const Checkin2({super.key, required this.bookingId});

  @override
  State<Checkin2> createState() => _Checkin2();
}

class _Checkin2 extends State<Checkin2> {
  late Future<Booking> futurBooking;
  String? dataToWrite;

  @override
  void initState() {
    super.initState();
    futurBooking = fetchBookingById(widget.bookingId);
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
      body: Center(
        child: Column(
          children: [
            FutureBuilder<Booking>(
              future: futurBooking,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dataToWrite = snapshot.data!.bookingId.toString();
                  return Text(snapshot.data!.bookingId.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            MaterialButton(
              onPressed: () => {
                updateBooking(dataToWrite!),
                if(dataToWrite != null)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NfcWriteData(dataToWrite: dataToWrite ?? ''),
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
    );
  }
}
