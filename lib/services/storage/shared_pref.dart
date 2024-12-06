import 'package:shared_preferences/shared_preferences.dart';
class SharedPref {
  static SharedPreferences? prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setAllowNotifications(bool value) async {
    await prefs?.setBool('allow_notifications', value);
  }

  static bool? getAllowNotifications() {
    return prefs?.getBool('allow_notifications');
  }

  static Future<void> setLocationSharing(bool value) async {
    await prefs?.setBool('location_sharing', value);
  }

  static bool? getLocationSharing() {
    return prefs?.getBool('location_sharing');
  }

  static Future<void> setLocationSet(String value) async {
    await prefs?.setString('location_set', value);
  }

  static String? getLocationSet() {
    return prefs?.getString('location_set');
  }

  static Future<void> clearPreferences() async {
    await prefs?.clear();
  }

}