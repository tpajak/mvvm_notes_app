import 'package:flutter/material.dart';

class AppTheme {
  ThemeData theme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, brightness: Brightness.light),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 30),
        bodyMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 20),
      ));

  ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      brightness: Brightness.dark,
    ),
  );
}
