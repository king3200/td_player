import 'package:flutter/material.dart';


class TestCountNotifier extends ChangeNotifier {
  int count = 0;

  void increase() {
    count ++;
    notifyListeners();
  }
}