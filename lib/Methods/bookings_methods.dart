import 'dart:io';
import 'package:hostellerie/Models/nfc.dart';
import 'package:http/http.dart' as http;
import '../Models/booking.dart';

import 'dart:convert';

Future<Booking> fetchBookingById(String bookingId) async {
  final response = await http.get(Uri.parse(
      'https://hostellerie-asteracee.online/api/bookings/$bookingId'));

  if (response.statusCode == 200) {

    return Booking.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load booking');
  }
}

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

updateBooking(String bookingId) async {
  final response = await http.get(Uri.parse(
      'https://hostellerie-asteracee.online/api/bookings/confirm/$bookingId'));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed to confirm booking');
  }
}


Future<List<Booking>> fetchAllBookings( ) async {
  final response = await http.get(Uri.parse(
      'https://hostellerie-asteracee.online/api/bookings'));

  if (response.statusCode == 200) {
    return bookingListFromJson(response.body);
  } else {
    throw Exception('Failed to load booking');
  }
}
List<Booking> bookingListFromJson(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingListToJson(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


Future<String> getHash(String bookingId) async {
  final body = {'booking_id': bookingId};
  final jsonString = json.encode(body);
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  final response = await 
  http.post(Uri.parse('https://hostellerie-asteracee.online/api/nfc'), headers: headers, body: jsonString);
  if (response.statusCode == 201) {
    return Nfc.fromJson(jsonDecode(response.body)).hash;
  } else {
    throw Exception('too many key created');
  }
}

