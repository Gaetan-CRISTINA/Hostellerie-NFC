import 'dart:convert';
import 'dart:io';
import 'package:hostellerie/Models/door_response.dart';
import 'package:http/http.dart' as http;

import '../Models/room_identity.dart';

Future openDoor(int roomId, String hash, String token) async {
  final body = {'room_id': roomId, 'hash': hash};
  final jsonString = json.encode(body);
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
  final response = await
  http.post(Uri.parse('https://hostellerie-asteracee.online/api/openDoor'),
      headers: headers,
      body: jsonString);
  if (response.statusCode == 200) {
    return doorResponseFromJson(response.body);
  } else if (response.statusCode == 401) {
    return doorResponseFromJson(response.body);
  } else {
    throw Exception('error call api');
  }
}

Future<List<RoomIdentity>> getAllRooms(String token) async{
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
  var response = await http
      .get(Uri.parse('https://hostellerie-asteracee.online/api/getAllRooms'),headers: headers
  );
  if (response.statusCode == 200) {
    return roomIdentityFromJson(response.body);
  } else {
    throw Exception('Failed to load rooms');
  }
}

List<RoomIdentity> roomIdentityFromJson(String str) => List<RoomIdentity>.from(json.decode(str).map((x) => RoomIdentity.fromJson(x)));

String roomIdentityToJson(List<RoomIdentity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));