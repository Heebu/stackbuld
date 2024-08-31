import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class MySignInTextFields extends StatelessWidget {
  MySignInTextFields(
      {super.key,
      required this.label,
      required this.hint,
      required this.textEditingController,
      required this.textInputType,
      this.isObscured = false});

  final String label;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  bool isObscured;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          // color: MyAppColors().mainColor,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: MyAppColors().mainColor)
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextFormField(
            controller: textEditingController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              //labelText: label,
              border: InputBorder.none,
              hintText: hint,
            ),
            keyboardType: textInputType,
            obscureText: isObscured,
          ),
        ),
      ),
    );
  }
}
