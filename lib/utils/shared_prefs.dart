import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  // Singleton instance
  static final SharedPrefsUtil _instance = SharedPrefsUtil._internal();

  late SharedPreferences _prefs;

  // Factory constructor to return the singleton instance
  factory SharedPrefsUtil() {
    return _instance;
  }

  // Make this a private constructor
  SharedPrefsUtil._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isOnboardingShown() {
    return _prefs.getBool('onboarding_shown') ?? false;
  }

  /// Handle the data based on onboarding is shown or not.
  static Future<void> setOnboardingShown(bool shown) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarding_shown', shown);
  }
}
