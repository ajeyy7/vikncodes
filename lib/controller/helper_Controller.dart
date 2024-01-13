import 'package:shared_preferences/shared_preferences.dart';

class HelperClass {
 static Future<String?> getAccessTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}