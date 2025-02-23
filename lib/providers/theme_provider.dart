import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Theme provider
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    loadTheme();
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool("isDarkMode", state == ThemeMode.dark);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool("isDarkMode") ?? false;
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
