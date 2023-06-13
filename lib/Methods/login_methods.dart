// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void loginUser(
    {required TextEditingController password,
    required TextEditingController email}) async {
  final data = {
    'email': email.text.toString(),
    'password': password.text.toString(),
  };

  final jsonString = json.encode(data);
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  final response = await http.post(
      Uri.parse('https://hostellerie-asteracee.online/api/login'),
      headers: headers,
      body: jsonString);
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Pas OK!!');
    throw Exception('Fail to login');
  }
}
