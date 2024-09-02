import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../../../Services/Firebase/FirebaseAuths/authentification.dart';
import '../../core/reuseable/Widgets/snack_bars.dart';

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

  void signUpButton(context) async {
    isLoading = true;
    notifyListeners();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    if (password != confirmPassword) {
      showSnackBar(context, 'Password does not match');
    } else if (email.isNotEmpty && password.isNotEmpty) {
      try {
        String result = await Auths().signUp(email, password);
        if (result == 'success') {
          await Auths().addCredInfo(firstName, lastName, email, password);
          Navigator.pushNamed(context, '/SignUpMore');
        } else {
          showSnackBar(context, result);
        }
        isLoading = false;
        notifyListeners();
      } catch (e) {
        isLoading = false;
        notifyListeners();
        showSnackBar(context, e.toString());
      }
    } else {
      isLoading = false;
      notifyListeners();
      showSnackBar(context, 'Please fill in the necessary credentials ');
    }
    isLoading = false;
    notifyListeners();
  }
}
