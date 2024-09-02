import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../core/reuseable/Utils/app_colors.dart';
import '../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../core/reuseable/Widgets/sign_in_textfeild.dart';
import '../../viewmodel/auths_viewmodel/sign_up_more_viewmodel.dart';

class SignUpMoreScreen extends StatelessWidget {
  const SignUpMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpMoreViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  children: [
                    Text1(
                      text: 'More Information',
                      color: MyAppColors().mainColor,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      height: 120.h,
                      width: 140.w,
                      child: viewModel.profileImage.isEmpty
                          ? Stack(
                              children: [
                                CircleAvatar(
                                  radius: 80.r,
                                  backgroundColor:
                                      MyAppColors().imageLoadingColor,
                                  child: Icon(
                                    Icons.person,
                                    size: 60.sp,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    viewModel.pickProfileImage(context);
                                  },
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      backgroundColor: MyAppColors().mainColor,
                                      radius: 25.r,
                                      child: Icon(
                                        Icons.add,
                                        color: MyAppColors().imageLoadingColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : CircleAvatar(
                              radius: 80.r,
                              backgroundColor: MyAppColors().imageLoadingColor,
                              backgroundImage:
                                  NetworkImage(viewModel.profileImage),
                            ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      children: [
                        //phone number
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.h),
                          width: MediaQuery.sizeOf(context).width / 2.3,
                          child: MySignInTextFields(
                            hint: 'Phone number',
                            label: '080123456789',
                            textEditingController:
                                viewModel.phoneNumberController,
                            textInputType: TextInputType.phone,
                          ),
                        ),
                        //whatsapp number
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.h),
                          width: MediaQuery.sizeOf(context).width / 2.3,
                          child: MySignInTextFields(
                            hint: 'WhatsApp number',
                            label: '080123456789',
                            textEditingController:
                                viewModel.whatsAppNumberController,
                            textInputType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.moreInforFunction(context);
                        },
                        child: viewModel.isLoading == true
                            ? const CircularProgressIndicator()
                            : Text2(
                                text: 'Register >>>',
                                color: MyAppColors().mainColor,
                              ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
