// ignore_for_file: empty_constructor_bodies, prefer_final_fields, constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hostellerie/Methods/shared_pref.dart';
import 'package:hostellerie/Models/loginResponse.dart';
import 'package:http/http.dart' as http;

enum Status { NotLoggedIn, LoggedIn }

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;
  String? token;
  SharedPrefRepository sharedPrefRepository = SharedPrefRepository();

  AuthProvider() {
    token = sharedPrefRepository.getToken();
  }

  LoginResponse loginResponseFromJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

  // getUserInfo(){
  // TODO à l'ouverture de main
  // }

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
      token = loginResponse.token;
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      sharedPrefRepository.setToken(loginResponse.token);
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
    }
  }

  void logoutUser() {
    _loggedInStatus = Status.NotLoggedIn;
    notifyListeners();
    sharedPrefRepository.setToken('');
  }
}
