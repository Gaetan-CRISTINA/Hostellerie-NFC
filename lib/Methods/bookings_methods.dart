import 'dart:io';
import 'package:hostellerie/Models/nfc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Models/booking.dart';

import 'dart:convert';

import '../Providers/AuthProvider.dart';

Future<Booking> fetchBookingById(String bookingId, String token) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
  final response = await http.get(Uri.parse('$apiUrl/api/bookings/$bookingId'),
      headers: headers);

  if (response.statusCode == 200) {
    return Booking.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load booking');
  }
}

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

updateBooking(String bookingId, String token) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
  final response = await http.get(
      Uri.parse('$apiUrl/api/bookings/confirm/$bookingId'),
      headers: headers);
  if (response.statusCode == 200) {
    return true;
  } else if (response.statusCode == 401) {
    
  } else {
    throw Exception('Failed to confirm booking');
  }
}

Future<List<Booking>> fetchAllBookings(String token) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
  final response = await http.get(
      Uri.parse('$apiUrl/api/bookings/confirmedOngoingBooking'),
      headers: headers);

  if (response.statusCode == 200) {
    return bookingListFromJson(response.body);
  } else {
    throw Exception('Failed to load booking');
  }
}

List<Booking> bookingListFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingListToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<String> getHash(String bookingId, String token) async {
  final body = {'booking_id': bookingId};
  final jsonString = json.encode(body);
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
  final response = await http.post(Uri.parse('$apiUrl/api/nfc'),
      headers: headers, body: jsonString);
  if (response.statusCode == 201) {
    return Nfc.fromJson(jsonDecode(response.body)).hash;
  } else {
    throw Exception('too many key created');
  }
}
