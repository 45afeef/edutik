import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  static final SharedPrefsUtil _instance = SharedPrefsUtil._internal();
  late SharedPreferences _prefs;

  factory SharedPrefsUtil() {
    return _instance;
  }

  SharedPrefsUtil._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Handle the data based on onboarding is shown or not.
  static Future<void> setOnboardingShown(bool shown) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarding_shown', shown);
  }

  bool isOnboardingShown() {
    return _prefs.getBool('onboarding_shown') ?? false;
  }
}
