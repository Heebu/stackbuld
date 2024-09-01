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
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.vdo.ai/blog/wp-content/uploads/2022/01/Blog-Header-22.png'))),
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
                              itemModel: ItemModel(
                                  itemName: 'Versasse dress',
                                  description:
                                      'This is an exclusive wear for everyone ',
                                  brandName: 'H&M',
                                  colors: ['red', 'blue', 'green'],
                                  favorites: [],
                                  images: [
                                    'https://e7.pngegg.com/pngimages/46/284/png-clipart-cocktail-dress-clothing-sleeve-prom-blue-tee-dress-blue-orange-thumbnail.png',
                                    'https://png.pngtree.com/png-clipart/20210725/original/pngtree-wedding-dress-clipart-blue-color-illustration-design-png-image_6557291.jpg'
                                  ],
                                  itemPrice: 2000,
                                  newPrice: 1500,
                                  ratings: [],
                                  sizes: ['M', 'L', 'XL', 'XXL']),
                              index: index,
                            );
                          },
                          itemCount: 3,
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
