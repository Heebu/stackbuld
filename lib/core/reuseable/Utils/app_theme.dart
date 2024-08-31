
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackbuld/core/reuseable/Utils/ui_sizes.dart';
import 'package:stacked/stacked.dart';

import 'app_colors.dart';

class MyThemes extends BaseViewModel {
  ThemeMode themeMode = ThemeMode.system;
  ThemeData themeData = MyThemeData().lightTheme;
  bool isLightTheme = true;

  changeTheme(bool theme) {

    if (theme == false) {

        themeMode = ThemeMode.dark;
        themeData = MyThemeData().darkTheme;
        isLightTheme = !isLightTheme;
        notifyListeners();
        print(theme);


    } else if (theme == true) {

        themeMode = ThemeMode.light;
        themeData = MyThemeData().lightTheme;
        isLightTheme = !isLightTheme;
        notifyListeners();
        print(theme);
    }
    notifyListeners();
  }
}

class MyThemeData {
  ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      //backgroundColor: Colors.yellow,
      centerTitle: true,
      iconTheme: IconThemeData(color: MyAppColors().mainColor, size: 24.sp),
      titleTextStyle: TextStyle(
        fontSize: MyTextSizes().textSize1,
        fontWeight: FontWeight.bold,
        color: MyAppColors().mainColor,
      ),
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
  );

  ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      //backgroundColor: Colors.blue,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      titleTextStyle: TextStyle(
        fontSize: MyTextSizes().textSize1,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      color: Colors.green.shade900,
    ),
    scaffoldBackgroundColor: Colors.green.shade50,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    useMaterial3: true,
  );
}
