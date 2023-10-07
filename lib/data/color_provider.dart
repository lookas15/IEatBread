import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color currentColor = Colors.red;

  void changeColor(Color color) {
    currentColor = color;
    notifyListeners();
  }
}
