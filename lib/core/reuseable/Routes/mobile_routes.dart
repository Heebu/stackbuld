import 'package:flutter/cupertino.dart';
import 'package:stackbuld/views/auth_pages/sign_up.dart';

import '../../../views/auth_pages/forgot_password.dart';
import '../../../views/auth_pages/sign_in.dart';
import '../../../views/auth_pages/sign_up_more_screen.dart';
import '../../../views/user_screen/HomeScreen/home_view.dart';
import '../../../views/user_screen/main_page_view.dart';

Map<String, Widget Function(BuildContext)> route = {
  '/': (context) => const SignIn(),
  '/main_page_view': (context) => const MainPageView(),
  '/user_home': (context) => const UserHome(),
  '/login': (context) => const SignIn(),
  '/signup': (context) => const SignUpScreen(),
  '/SignUpMore': (context) => const SignUpMoreScreen(),
  '/forgot_password': (context) => const ForgetPassword(),
};
