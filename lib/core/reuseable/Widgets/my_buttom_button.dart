import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/ui_sizes.dart';
import 'mainTextWidget.dart';

class MyButtomButton extends StatelessWidget {
  MyButtomButton(
      {super.key,
      required this.text,
      this.textColor = Colors.white,
      this.buttonColor = Colors.green});

  final String text;
  Color? buttonColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(MyTextSizes().normalBorder)),
      child: Center(
        child: MainTextWidget(
          text: text,
          color: textColor,
        ),
      ),
    );
  }
}
