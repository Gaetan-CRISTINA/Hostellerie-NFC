// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:hostellerie/Methods/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Models/loginResponse.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

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
    final loginResponse = loginResponseFromJson(response.body);

    SharedPrefRepository sharedPrefRepository = SharedPrefRepository();

    sharedPrefRepository.setToken(loginResponse.token);

    print(sharedPrefRepository.token);
  } else {
    print('Pas OK!!');
    throw Exception('Fail to login');
  }
}
