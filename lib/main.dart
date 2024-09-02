import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'core/reuseable/Routes/mobile_routes.dart';
import 'core/reuseable/Utils/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AdmobServices.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(411.42857142857144, 683.4285714285714),
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        builder: (context, _) =>
        ViewModelBuilder<MyThemes>.reactive(
          viewModelBuilder: () => MyThemes(),
          builder: (context, model, child) =>
              MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'StackBuld',
                themeMode: model.themeMode,
                darkTheme: MyThemeData().darkTheme,
                theme: model.themeData,
                routes: route,
              ),
        ),
      ),
    );
  }
}
