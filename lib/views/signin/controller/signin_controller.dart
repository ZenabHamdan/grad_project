import 'package:grad_project/exports/exports.dart';

class SigninController {
 static const String kIsLoggedIn = 'isLoggedIn';
  static const String kTokenKey = 'token';

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kIsLoggedIn) ?? false;
  }

  Future<void> saveLoginStatus({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kIsLoggedIn, true);
    await prefs.setString(kTokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kTokenKey);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}