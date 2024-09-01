import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/reuseable/Widgets/item_buttons.dart';
import '../../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../../model/item_model.dart';
import '../../../viewmodel/user_screen/category_page_viewmodel.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CategoryPageViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text2(text: pageTitle, isBold: true),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250.h,
                  crossAxisSpacing: 3.w),
              itemBuilder: (context, index) => MyItemBox(
                itemModel: ItemModel(
                    itemName: 'Versasse dress',
                    description: 'This is an exclusive wear for everyone ',
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
              ),
              itemCount: 5,
            ),
          ),
        );
      },
    );
  }
}
