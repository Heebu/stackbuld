import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../core/reuseable/Utils/infor_list.dart';
import '../../../core/reuseable/Widgets/item_buttons.dart';
import '../../../core/reuseable/Widgets/reuseable_dropdown.dart';
import '../../../model/item_model.dart';
import '../../../viewmodel/user_screen/search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SearchViewmodel(),
      builder: (context, viewModel, child) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                SearchBar(
                  leading: Icon(Icons.search),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {},
                  hintText: 'Search for item',
                ),
                Container(
                  height: 50.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final dropdownItem = filterItems[index];
                        final title = dropdownItem['title'];
                        final items = dropdownItem['items'];

                        return Container(
                          width: 150.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: ReusableDropdownButton(
                            title: title,
                            items: items,
                            onChanged: (String? value) {},
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                      itemCount: filterItems.length),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250.h,
                          crossAxisSpacing: 3.w),
                      itemBuilder: (context, index) => MyItemBox(
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
                      ),
                      itemCount: 5,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}

List filterItems = [
  {'title': 'Type', 'items': itemTypes},
  {'title': 'Color', 'items': colorItem},
  {'title': 'Size', 'items': sizes},
];
