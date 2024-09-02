import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class MainPageViewmodel extends BaseViewModel {
  PageController pageController = PageController();
  int pageNumber = 0;
  String timeGreeting = '';
  String name = '';
  String image = '';

  void getGreeting() {
    final DateTime now = DateTime.now();
    final int hour = now.hour;
    if (hour < 12) {
      timeGreeting = 'Good Morning';
    } else if (hour < 17) {
      timeGreeting = 'Good Afternoon';
    } else if (hour < 20) {
      timeGreeting = 'Good Evening';
    } else {
      timeGreeting = 'Good Night';
    }
    notifyListeners();
  }

  onChangePage(value) {
    pageController.animateToPage(value,
        duration: const Duration(seconds: 1), curve: Curves.linear);
    pageNumber = value;
    notifyListeners();
  }

  getUserInfo() async {}

  initClass() async {
    getGreeting();
    await getUserInfo();
  }
}
