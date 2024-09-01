import 'package:flutter/cupertino.dart';

import '../../../views/auth_pages/login.dart';
import '../../../views/user_screen/HomeScreen/home_view.dart';
import '../../../views/user_screen/main_page_view.dart';

Map<String, Widget Function(BuildContext)> route = {
  '/': (context) => const MainPageView(),
  'user_home': (context) => const UserHome(),
  '/login': (context) => const LoginView(),
};

// final mobileRoute = GoRouter(
//   initialLocation: SplashScreen.path,
//   routes: [
//     GoRoute(
//       name: AllCategoriesView.name,
//       path: AllCategoriesView.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const AllCategoriesView(),
//     ),
//     GoRoute(
//       name: SplashScreen.name,
//       path: SplashScreen.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const SplashScreen(),
//     ),
//     GoRoute(
//       name: SalesAnalyticsViewMobile.name,
//       path: SalesAnalyticsViewMobile.path,
//       builder: (BuildContext context, GoRouterState state) =>
//       const SalesAnalyticsViewMobile(),
//     ),
//     GoRoute(
//       name: SignIn.name,
//       path: SignIn.path,
//       builder: (BuildContext context, GoRouterState state) => const SignIn(),
//     ),
//     GoRoute(
//       name: SignUpMoreScreen.name,
//       path: SignUpMoreScreen.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const SignUpMoreScreen(),
//     ),
//
//     GoRoute(
//       name: SignUpScreen.name,
//       path: SignUpScreen.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const SignUpScreen(),
//     ),
//     GoRoute(
//       name: MobileIntroScreen.name,
//       path: MobileIntroScreen.path,
//       pageBuilder: (BuildContext context, GoRouterState state) =>
//           CupertinoPage<void>(
//         child: const MobileIntroScreen(),
//         key: state.pageKey,
//       ),
//     ),
//     GoRoute(
//       name: ForgetPassword.name,
//       path: ForgetPassword.path,
//       builder: (BuildContext context, GoRouterState state) => ForgetPassword(),
//     ),
//     GoRoute(
//       name: MainPage.name,
//       path: MainPage.path,
//       builder: (BuildContext context, GoRouterState state) => MainPage(),
//     ),
//     GoRoute(
//       name: NotificationPageViewMobile.name,
//       path: NotificationPageViewMobile.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const NotificationPageViewMobile(),
//     ),
//
//     GoRoute(
//       name: HomeSearchView.name,
//       path: HomeSearchView.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const HomeSearchView(),
//     ),
//
//     GoRoute(
//       name: CartPreviewView.name,
//       path: CartPreviewView.path,
//       builder: (BuildContext context, GoRouterState state) =>
//           const CartPreviewView(),
//     ),
//
//     ///stoped
//     // GoRoute(
//     //     name: ForgetPassword.name,
//     //     path: ForgetPassword.path,
//     //     pageBuilder: (BuildContext context, GoRouterState state) {
//     //       return CupertinoPage<void>(
//     //         child: ForgetPassword(),
//     //         key: state.pageKey,
//     //       );
//     //     }),
//     // GoRoute(
//     //   name: Documents.name,
//     //   path: Documents.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const Documents(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: Hostels.name,
//     //   path: Hostels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const Hostels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: Feeds.name,
//     //   path: Feeds.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const Feeds(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: HomeView.name,
//     //   path: HomeView.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const HomeView(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //     name: SeeAllScreen.name,
//     //     path: SeeAllScreen.path,
//     //     pageBuilder: (BuildContext context, GoRouterState state) {
//     //       return CupertinoPage<void>(
//     //         child: const SeeAllScreen(),
//     //         key: state.pageKey,
//     //       );
//     //     }),
//     // GoRoute(
//     //     name: DrawerView.name,
//     //     path: DrawerView.path,
//     //     pageBuilder: (BuildContext context, GoRouterState state) {
//     //       return CupertinoPage<void>(
//     //         child: DrawerView(),
//     //         key: state.pageKey,
//     //       );
//     //     }),
//     // GoRoute(
//     //   name: Uploads.name,
//     //   path: Uploads.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const Uploads(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddItem.name,
//     //   path: AddItem.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddItem(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: SignUpScreen.name,
//     //   path: SignUpScreen.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const SignUpScreen(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AboutView.name,
//     //   path: AboutView.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AboutView(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: SettingsView.name,
//     //   path: SettingsView.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const SettingsView(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: ProfileEdit.name,
//     //   path: ProfileEdit.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const ProfileEdit(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: HelpAndSupportScreen.name,
//     //   path: HelpAndSupportScreen.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const HelpAndSupportScreen(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//     // GoRoute(
//     //   name: AddChannels.name,
//     //   path: AddChannels.path,
//     //   pageBuilder: (BuildContext context, GoRouterState state) =>
//     //       CupertinoPage<void>(
//     //     child: const AddChannels(),
//     //     key: state.pageKey,
//     //   ),
//     // ),
//   ],
// );
