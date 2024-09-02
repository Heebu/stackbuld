import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../Services/Firebase/FirebaseAuths/authentification.dart';
import '../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../core/reuseable/Widgets/snack_bars.dart';

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
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        String result = await Auths().signIn(email, password);
        if (result == 'success') {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, '/user_home');
        } else if (result ==
            'Please go to your mail to verify your mail account') {
          showSnackBar(context, result);
          Future.delayed(const Duration(seconds: 3), () {
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Text1(text: 'Resend Link'),
                    content: Text2(
                      text:
                      'Would you like to get a resend of the verification link to your mail?',
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            String result = await Auths().resendVerfLink();
                            if (result == 'success') {} else {
                              showSnackBar(context, result);
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString());
                          }
                          Navigator.pop(context);
                        },
                        child: SmallTexts(
                          text: 'Resend',
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: SmallTexts(
                            text: 'Close',
                          )),
                    ],
                  ),
            );
          });
        } else {
          showSnackBar(context, result);
        }
        isLoading = false;
        notifyListeners();
      } catch (e) {
        showSnackBar(context, e.toString());
        isLoading = false;
        notifyListeners();
      }
    } else {
      isLoading = false;
      notifyListeners();
      showSnackBar(context, 'Please fill in the necessary credentials ');
    }
  }

  signUpFunc(context) {
    Navigator.pushNamed(context, '/signup');
  }
}
