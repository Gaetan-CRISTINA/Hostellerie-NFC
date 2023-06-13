import 'package:hostellerie/Models/loginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository {
  SharedPreferences? sharedPreferences;
  String token = '';

  void getSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences?.getString('token') ?? '';
  }

  SharedPrefRepository() {
    getSharedPrefs();
  }

  String getToken() {
    return token;
  }

  setToken(String value) {
    token = value;
    sharedPreferences?.setString('token', token);
  }
}
