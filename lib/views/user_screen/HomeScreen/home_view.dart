import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/reuseable/Utils/infor_list.dart';
import '../../../core/reuseable/Widgets/item_buttons.dart';
import '../../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../../model/item_model.dart';
import '../../../viewmodel/user_screen/home_viewmodel.dart';
import 'cartegory_page_view.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initClass(),
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, viewModel, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(children: [
              SizedBox(
                height: 150.h,
                child: PageView.builder(
                  itemBuilder: (context, index) => Container(
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.vdo.ai/blog/wp-content/uploads/2022/01/Blog-Header-22.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text2(text: 'Shop by categories', isBold: true),
                        TextButton(
                            onPressed: () {},
                            child: const Text3(text: 'see all'))
                      ],
                    ),
                    SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryPageView(
                                      pageTitle: categories[index],
                                    ),
                                  ));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50.r,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: AssetImage(catImages[index]),
                                ),
                                Text2(text: categories[index], isBold: true)
                              ],
                            ),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text2(text: 'Curated for you', isBold: true),
                        // TextButton(
                        //     onPressed: () {},
                        //     child: const Text3(text: 'see all'))
                      ],
                    ),
                    SizedBox(
                        height: 250.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20.w,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MyItemBox(
                              itemModel: viewModel.items[index],
                              index: index,
                            );
                          },
                          itemCount: viewModel.items.length,
                        )),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
