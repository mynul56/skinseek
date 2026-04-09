import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/skin_profile.dart';

class SetupRepository {
  static const String _profileKey = 'skin_profile';
  static const String _currentStepKey = 'setup_current_step';

  Future<void> saveProfile(SkinProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileKey, jsonEncode(profile.toJson()));
  }

  Future<SkinProfile?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_profileKey);
    if (data == null) return null;
    return SkinProfile.fromJson(jsonDecode(data));
  }

  Future<void> saveCurrentStep(int step) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_currentStepKey, step);
  }

  Future<int> getCurrentStep() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_currentStepKey) ?? 0;
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_profileKey);
    await prefs.remove(_currentStepKey);
  }
}
