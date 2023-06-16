// ignore_for_file: empty_constructor_bodies, prefer_final_fields, constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hostellerie/Models/loginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Status { NotLoggedIn, LoggedIn, Loading }

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.Loading;

  Status get loggedInStatus => _loggedInStatus;
  String? token;
  late SharedPreferences sharedPrefRepository;

  AuthProvider() {
    initSharedPref();
  }

  initSharedPref() async {
    sharedPrefRepository = await SharedPreferences.getInstance();
    token = sharedPrefRepository.getString('token');
    getUserInfo();
  }

  LoginResponse loginResponseFromJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

  getUserInfo() async {
    final data = {
      'token': token,
    };

    final jsonString = json.encode(data);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.post(
        Uri.parse('https://hostellerie-asteracee.online/api/findUser'),
        headers: headers,
        body: jsonString);

    if (response.statusCode == 200) {
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
    }
  }

  void loginUser(
      {required TextEditingController password,
      required TextEditingController email})
  async {
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
      await sharedPrefRepository.setString('token',loginResponse.token);
      notifyListeners();
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
    }
  }

  void logoutUser() async {
    _loggedInStatus = Status.NotLoggedIn;
    await sharedPrefRepository.remove('token');
    notifyListeners();
  }
}
