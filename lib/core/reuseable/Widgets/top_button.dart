import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/ui_sizes.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
  });

  final String text;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(-1, 1),
              spreadRadius: 1,
              color: Colors.grey.shade100,
              blurRadius: .5)
        ],
        color: buttonColor,
        borderRadius: BorderRadius.circular(MyTextSizes().smallBorder),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: MyTextSizes().textSize2,
          ),
        ),
      ),
    );
  }
}
