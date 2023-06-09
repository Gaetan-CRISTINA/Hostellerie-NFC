import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository{
  SharedPreferences? sharedPreferences;
  bool test = false;

  void getSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPrefRepository(){
    getSharedPrefs();
  }
}