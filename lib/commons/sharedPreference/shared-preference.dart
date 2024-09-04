import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String onboardingKey = 'onboarding_seen';

  static Future<void> setOnboardingSeen(bool seen) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingKey, seen);
  }

  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false;
  }
}
