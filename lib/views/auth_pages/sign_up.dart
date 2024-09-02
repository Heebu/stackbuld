import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../core/reuseable/Utils/app_colors.dart';
import '../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../core/reuseable/Widgets/sign_in_textfeild.dart';
import '../../viewmodel/auths_viewmodel/sign_up_viewmodel.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String name = 'SignUpMobile';
  static const String path = '/SignUpMobile';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    // height: 30.h,
                    child: const Image(image: AssetImage('AppImages.appLogo')),
                  ),
                  Text1(
                    text: 'Welcome !',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: MySignInTextFields(
                          label: 'First Name',
                          hint: 'FIrst Name',
                          textEditingController: model.firstNameController,
                          textInputType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: MySignInTextFields(
                          label: 'Last Name',
                          hint: 'Last Name',
                          textEditingController: model.lastNameController,
                          textInputType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  MySignInTextFields(
                    label: 'Email',
                    hint: 'Email',
                    textEditingController: model.emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  MySignInTextFields(
                    label: 'Password',
                    hint: 'Password',
                    textEditingController: model.passwordController,
                    textInputType: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
                  MySignInTextFields(
                    label: 'Confirm Password',
                    hint: 'Confirm Password',
                    textEditingController: model.confirmPasswordController,
                    textInputType: TextInputType.visiblePassword,
                    isObscured: true,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        model.signUpButton(context);
                      },
                      child: model.isLoading == true
                          ? const CircularProgressIndicator()
                          : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text1(
                          text: 'Sign Up',
                          color: MyAppColors().mainColor,
                        ),
                      )),


                  SizedBox(

                    height: 250.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          //ElevatedButton(onPressed: (){}, child: Text('Sign up with google')),
                          ElevatedButton(onPressed: () {
                            model.signInFunc(context);
                          }, child: const Text('Want to log in?')),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
