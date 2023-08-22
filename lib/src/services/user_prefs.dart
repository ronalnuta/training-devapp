import 'package:flutter/material.dart';
import 'package:my_app/src/config/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme
  ThemeMode getTheme() {
    final value = _prefs.getString(XKeys.theme);

    return ThemeMode.values.firstWhere(
      (e) => e.toString().toLowerCase() == '$value'.toLowerCase(),
      orElse: () => ThemeMode.system,
    );
  }

  void setTheme(ThemeMode value) {
    _prefs.setString(
      XKeys.theme,
      value.toString().toLowerCase(),
    );
  }

  // onboarding
  bool get hasViewedOnboarding => _prefs.getBool(XKeys.onboarding) ?? false;

  Future<void> setViewedOnboarding() => _prefs.setBool(
        XKeys.onboarding,
        true,
      );

  // account login
  String get getUsername => _prefs.getString(XKeys.username) ?? "";
  String get getPass => _prefs.getString(XKeys.password) ?? "";

  void saveLoginInfo({
    required String user,
    required String pass,
  }) {
    _prefs.setString(
      XKeys.username,
      user,
    );
    _prefs.setString(
      XKeys.password,
      pass,
    );
  }

  void removeLoginInfo() {
    _prefs.remove(XKeys.username);
    _prefs.remove(XKeys.password);
  }

  // current user
  String get getTokenAccount => _prefs.getString(XKeys.tokenAccount) ?? "";

  void setTokenAccount(String? token) => _prefs.setString(
        XKeys.tokenAccount,
        token ?? "",
      );
}
