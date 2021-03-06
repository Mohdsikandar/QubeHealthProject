
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themeclass {

  static final darkthem =ThemeData(
    scaffoldBackgroundColor:  Colors.black,
    backgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        color: Colors.red
    ),

  );

  static final lighttheme =ThemeData(
    scaffoldBackgroundColor:  Colors.black,
    backgroundColor: Colors.black,

  );


}