import 'package:grad_project/exports/exports.dart';

class SignUpController {
  static const String kIsLoggedIn = 'isLoggedIn';
  static const String kUserNameKey = 'userName';
  static const String kEmailKey = 'email';

  // Check signup status
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kIsLoggedIn) ?? false;
  }

  // Save signup data
  Future<void> saveSignUpData(
      {required String userName, required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kIsLoggedIn, true);
    await prefs.setString(kUserNameKey, userName);
    await prefs.setString(kEmailKey, email);
  }

  // Retrieve user data
  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'userName': prefs.getString(kUserNameKey),
      'email': prefs.getString(kEmailKey),
    };
  }

  // Clear signup data
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
