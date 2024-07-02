import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Required for ChangeNotifier

class ThemeController extends ChangeNotifier {
  static ThemeController _instance = ThemeController._internal();
  bool _isDarkMode = false; // Declare the private field to track dark mode status

  factory ThemeController() {
    return _instance;
  }

  ThemeController._internal();

  bool get isDarkModeEnabled => _isDarkMode; // Use the private field

  ThemeData getThemeData(bool isDarkMode) {
    return isDarkMode
        ? ThemeData.dark().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.green,
          )
        : ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.green,
          );
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value; // Update the dark mode status
    notifyListeners(); // Notify all listening widgets of the change
  }
}