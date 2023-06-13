// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Methods/bookings_methods.dart';
import '../Models/booking.dart';
import '../Components/customerCard.dart';
import '../Providers/AuthProvider.dart';

class CreateKey1 extends StatefulWidget {
  const CreateKey1({super.key});

  @override
  State<CreateKey1> createState() => _Booking();
}

class _Booking extends State<CreateKey1> {
  late Future<List<Booking>> futureResult;

  @override
  void initState() {
    super.initState();
    futureResult = fetchAllBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Room Key',
        ),
        backgroundColor: Color(0xFFe6b34b),
      ),
      body: FutureBuilder(
        future: futureResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 25, left: 10),
                  child: Text("Choose a booking",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ),
                ...snapshot.data!.map((e) {
                  return Center(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          CustomerCard(booking: e),
                        ],
                      ),
                    ),
                  );
                }).toList()
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            Provider.of<AuthProvider>(context, listen: false).logoutUser();
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
