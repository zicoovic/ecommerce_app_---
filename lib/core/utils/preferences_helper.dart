import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _genderKey = 'selected_gender';

  // Save gender
  static Future<void> saveGender(String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_genderKey, gender);
  }

  // Get gender
  static Future<String> getGender() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_genderKey) ?? 'all'; // default: all
  }

  // Clear
  static Future<void> clearGender() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_genderKey);
  }
}
