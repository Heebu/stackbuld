import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../core/reuseable/Utils/app_colors.dart';
import '../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../core/reuseable/Widgets/sign_in_textfeild.dart';
import '../../viewmodel/auths_viewmodel/forgot_password_viewmodel.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text1(
                    text: 'Forgot Password?',
                    color: MyAppColors().mainColor,
                  ),
                  MySignInTextFields(
                    label: 'Email',
                    hint: 'example@gmail.com',
                    textEditingController: model.emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text1(
                            text: 'Reset Password',
                            color: MyAppColors().mainColor,
                          ))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
