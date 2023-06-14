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
    fetchToken();
    getUserInfo();
  }

  fetchToken() async {
    token = await sharedPrefRepository.getToken();
  }

  LoginResponse loginResponseFromJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

  getUserInfo() async {
    print(token);
    // Ici on a pas le token
    final data = {
      'token': token,
    };

    final jsonString = json.encode(data);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.post(
        Uri.parse('https://hostellerie-asteracee.online/api/findUser'),
        headers: headers,
        body: jsonString);
    // On a  le token ICI
    // print(sharedPrefRepository.token);

    if (response.statusCode == 200) {
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
    }
    // Ici on a le token
    print(token);
  }

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
      _loggedInStatus = Status.LoggedIn;
      sharedPrefRepository.setToken(loginResponse.token);
      notifyListeners();
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
    }
  }

  void logoutUser() {
    _loggedInStatus = Status.NotLoggedIn;
    sharedPrefRepository.setToken('');
    notifyListeners();
  }
}
