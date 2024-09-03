import 'package:flutter/material.dart';
import 'package:stackbuld/core/reuseable/Widgets/mainTextWidget.dart';
import 'package:stacked/stacked.dart';

import '../../viewmodel/user_screen/main_page_viewmodel.dart';
import 'HomeScreen/home_view.dart';
import 'MyCartScreen/cart_view.dart';
import 'ProfileScreen/profile_view.dart';
import 'SearchScreen/search_view.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initClass(),
      viewModelBuilder: () => MainPageViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: const CircleAvatar(),
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text2(text: 'Idris Adedeji', isBold: true),
                Text3(
                  text: viewModel.timeGreeting,
                  color: Colors.black,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllCartView(),
                      ));
                },
                icon: const Icon(Icons.shopping_cart),
              )
            ],
          ),
          body: PageView(
            onPageChanged: (value) {
              viewModel.onChangePage(value);
            },
            controller: viewModel.pageController,
            children: const [
              UserHome(),
              SearchView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              viewModel.onChangePage(value);
            },
            currentIndex: viewModel.pageNumber,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey),
                  label: 'Home',
                  activeIcon: Icon(Icons.home, color: Colors.black),
                  tooltip: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.grey),
                  label: 'Explore',
                  activeIcon: Icon(Icons.search, color: Colors.black),
                  tooltip: 'Explore items'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.grey),
                  label: 'Profile',
                  activeIcon: Icon(Icons.search, color: Colors.black),
                  tooltip: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
