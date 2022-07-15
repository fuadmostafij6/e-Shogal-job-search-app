
import 'package:shared_preferences/shared_preferences.dart';

import 'consts_screen.dart';

class MyPrefs {
  SharedPreferences? preferences;

  static Future<void> setToken(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.id, authcode);
  }

  static Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constance.id) ?? "";
  }


}
