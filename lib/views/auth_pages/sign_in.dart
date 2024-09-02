import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../core/reuseable/Utils/app_colors.dart';
import '../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../core/reuseable/Widgets/sign_in_textfeild.dart';
import '../../viewmodel/auths_viewmodel/sign_in_viewmodel.dart';
import 'forgot_password.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text1(
                            text: 'Welcome Back!',
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

                          Padding(
                            padding: EdgeInsets.only(bottom: 30.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Checkbox(value: true, onChanged: (value){}),
                                // const Text('Remember me'),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgetPassword(),
                                          ));
                                    },
                                    child: const Text('Forgot password')),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                model.signInFunc(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: model.isLoading == true
                                    ? const CircularProgressIndicator()
                                    : Text1(
                                        text: 'Sign In',
                                        color: MyAppColors().mainColor,
                                      ),
                              )),

                          // TextButton(onPressed: (){}, child: const Text('Sign in with google')),

                          SizedBox(
                              height: 300.h,
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text3(text: "Don't have an account? "),
                                        TextButton(
                                            onPressed: () {
                                              model.signUpFunc(context);
                                            },
                                            child: const Text3(text: "Sign up"))
                                      ])))
                        ]),
                  ),
                ),
              ),
            ));
  }
}
