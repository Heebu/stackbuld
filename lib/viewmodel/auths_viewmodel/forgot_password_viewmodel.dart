import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../Services/Firebase/FirebaseAuths/authentification.dart';
import '../../core/reuseable/Widgets/snack_bars.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();

  forgotPassword(context) async {
    String email = emailController.text.toString();
    if (email.isNotEmpty) {
      try {
        String result = await Auths().forgotPassword(email);
        if (result == 'success') {
          Navigator.pop(context);
          showSnackBar(context, 'A link has been sent to your mail');
        } else {
          showSnackBar(context, result);
        }
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    } else {
      showSnackBar(context, 'Please fill in the email field');
    }
  }
}
