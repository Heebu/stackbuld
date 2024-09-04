import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isLoading = false;

  signInFunc(context) {
    Navigator.pop(context);
  }

  signUpButton(context) async {
    isLoading = true;
    notifyListeners();
    Navigator.pushNamed(context, '/SignUpMore');
    isLoading = false;
    notifyListeners();
  }
}
