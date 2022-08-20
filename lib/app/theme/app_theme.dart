import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  accentColor: Colors.blue,
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);

InputDecoration inputDecoration(String label) => InputDecoration(
    filled: true,
    labelText: label,
    fillColor: Colors.white,
    border: OutlineInputBorder());
