import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/reuseable/Widgets/item_buttons.dart';
import '../../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../../viewmodel/user_screen/category_page_viewmodel.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getItems(pageTitle),
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
                itemModel: viewModel.items[index],
                index: index,
              ),
              itemCount: viewModel.items.length,
            ),
          ),
        );
      },
    );
  }
}
