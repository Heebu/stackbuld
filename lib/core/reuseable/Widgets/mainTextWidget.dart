import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_text_flutter/smart_text_flutter.dart';

import '../Utils/ui_sizes.dart';

class TitleTextWidget extends StatelessWidget {
  TitleTextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Text(text,
          style: TextStyle(
              color: color,
              fontSize: MyTextSizes().textSize0,
              letterSpacing: 2,
              fontWeight: FontWeight.bold)),
    );
  }
}

class MainTextWidget extends StatelessWidget {
  MainTextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Text(text,
          style: TextStyle(
              color: color,
              fontSize: MyTextSizes().textSize1,
              fontWeight: FontWeight.bold)),
    );
  }
}

class NormalTexts extends StatelessWidget {
const  NormalTexts({super.key, required this.text, this.color, this.isBold = false});

  final String text;
  final Color? color;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: MyTextSizes().textSize2,
          fontWeight: isBold! ? FontWeight.w800 : FontWeight.normal),
    );
  }
}

class SmallTexts extends StatelessWidget {
  SmallTexts({super.key, required this.text, this.color});

  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: MyTextSizes().textSize3),
    );
  }
}

class SmallSmartTexts extends StatelessWidget {
  const SmallSmartTexts({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SmartText(
      text,
      strutStyle: StrutStyle(fontSize:  MyTextSizes().textSize3,),

    );
  }
}

class ContentSmartTexts extends StatelessWidget {
  const ContentSmartTexts({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize:  text.length / 2, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,

    );
  }
}



