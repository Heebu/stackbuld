import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  signInFunc(context) async {
    isLoading = true;
    notifyListeners();
    Navigator.pushReplacementNamed(context, '/main_page_view');
    isLoading = false;
    notifyListeners();
  }

  signUpFunc(context) {
    Navigator.pushNamed(context, '/signup');
  }
}
