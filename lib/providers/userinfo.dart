import 'package:flutter/material.dart';
import '../models/user.dart';

class UserInfoNotifier extends ChangeNotifier {
  User user;

  void setUserData(Map<String, dynamic> userJsonData) {
    user = User.fromJson(userJsonData);
    notifyListeners();
  }

  void clearUserData() {
    user = null;
    notifyListeners();
  }

  bool isLogin() {
    return user == null;
  }
}
