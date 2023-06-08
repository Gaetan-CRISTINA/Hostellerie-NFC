import 'package:http/http.dart' as http;
import '../Models/booking.dart';

import 'dart:convert';

Future<Booking> fetchBookingById(String bookingId) async {
    final response =
      await http.get(Uri.parse('https://hostellerie-asteracee.online/api/bookings/$bookingId'));

  if (response.statusCode == 200) {
    return Booking.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load booking');
  }
}

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());
