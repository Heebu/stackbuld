import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackbuld/model/cart_model.dart';
import 'package:stacked/stacked.dart';

import '../../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../../viewmodel/user_screen/edit_cart_viewmodel.dart';
import '../HomeScreen/item_review_view.dart';

class EditCartView extends StatelessWidget {
  const EditCartView({super.key, required this.cartItem});

  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initClass(cartItem.itemId),
      viewModelBuilder: () => EditCartViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        viewModel.editItem(context, cartItem.orderId);
                      },
                      icon: const Icon((Icons.edit)))
                ],
                expandedHeight: 350.h,
                collapsedHeight: 150.h,
                flexibleSpace: PageView.builder(
                  itemCount: viewModel.item.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          image: DecorationImage(
                              image: NetworkImage(viewModel.item.images[index]),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text3(text: viewModel.item.brandName),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text3(
                            text: viewModel.item.ratings.length.toString(),
                            isBold: true),
                        const Spacer(),
                      ],
                    ),
                    Text1(text: viewModel.item.itemName),
                    Row(
                      children: [
                        if (viewModel.item.itemPrice != viewModel.item.newPrice)
                          Text1(
                            text: '\$${viewModel.item.itemPrice}',
                            color: Colors.red,
                          ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text2(
                          text: '\$${viewModel.item.newPrice}',
                          color: Colors.green,
                        ),
                        Spacer(),
                        IconButton.filledTonal(
                            onPressed: () {
                              viewModel.decrement();
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red,
                            )),
                        Text2(text: viewModel.itemCount.toString()),
                        IconButton.filledTonal(
                            onPressed: () {
                              viewModel.increment(viewModel.item.itemCount);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.green,
                            )),
                      ],
                    ),
                    Text3(
                      text: viewModel.item.description,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(
                      height: 100.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text2(
                                text: 'Colors',
                                isBold: true,
                              ),
                              Row(
                                children: [
                                  for (int x = 0;
                                      x < viewModel.item.colors.length;
                                      x++)
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.pickColor(
                                            viewModel.item.colors[x]);
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(2.r),
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: pickColor(
                                                viewModel.item.colors[x]),
                                            border: Border.all(
                                                color: viewModel.colorPicked ==
                                                        viewModel.item.colors[x]
                                                    ? Colors.black
                                                    : Colors.grey),
                                          ),
                                          child: Center(
                                            child: Text3(
                                              text: viewModel.item.colors[x],
                                              color: viewModel.item.colors[x]
                                                          .toLowerCase() ==
                                                      'black'
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          )),
                                    ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text2(
                                text: 'Sizes',
                                isBold: true,
                              ),
                              Row(
                                children: [
                                  for (int x = 0;
                                      x < viewModel.item.sizes.length;
                                      x++)
                                    GestureDetector(
                                      onTap: () {
                                        viewModel
                                            .pickSize(viewModel.item.sizes[x]);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(3.r),
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          color: viewModel.sizePicked ==
                                                  viewModel.item.sizes[x]
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              color: viewModel.sizePicked ==
                                                      viewModel.item.sizes[x]
                                                  ? Colors.black
                                                  : Colors.grey),
                                        ),
                                        child: Center(
                                            child: Text1(
                                          text: viewModel.item.sizes[x],
                                          color: viewModel.sizePicked ==
                                                  viewModel.item.sizes[x]
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
