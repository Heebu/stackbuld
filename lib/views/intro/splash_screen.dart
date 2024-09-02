import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/reuseable/Utils/app_colors.dart';
import '../auth_pages/sign_in.dart';
import '../user_screen/main_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    String textChange = 'Sell X';


   return

      StreamBuilder<User?>(
        stream: auth.authStateChanges(), // Listen to user auth state changes
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 170.h,
                          width: 170.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('AppImages.appLogoBig'))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          textChange,
                          style: TextStyle(
                              fontSize: 50.sp, fontWeight: FontWeight.bold, color: MyAppColors().mainColor),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 150.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('AppImages.splashBottomDesign'),
                              fit: BoxFit.fill,
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ); // Show loading indicator
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Handle errors
          }

          final user = snapshot.data;
          return user != null ? const MainPageView() : const SignIn();
        });
 }
}
