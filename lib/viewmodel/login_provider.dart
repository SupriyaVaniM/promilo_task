import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  bool get isSubmitButtonEnabled =>
      usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }
}
