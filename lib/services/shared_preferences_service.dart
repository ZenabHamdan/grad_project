import 'package:grad_project/exports/exports.dart';

class SharedPreferencesService {
  static const String kInstalled = 'installed';
  static const String kTokenKey = 'token';

  static Future<void> setInstalled({required String installed}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kInstalled, installed);
  }

  static Future<String?> getInstalled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getString(kInstalled);
    } catch (e) {
      debugPrint('Error getting installed flag: $e');
      return null;
    }
  }

  static Future<void> setToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kTokenKey, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getString(kTokenKey);
    } catch (e) {
      debugPrint('Error getting token: $e');
      return null;
    }
  }
}
