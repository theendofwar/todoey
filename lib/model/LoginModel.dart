import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  // could do check the email is valid or not
}
