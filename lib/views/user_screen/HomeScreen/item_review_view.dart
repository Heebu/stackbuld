import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/reuseable/Widgets/mainTextWidget.dart';
import '../../../model/item_model.dart';
import '../../../viewmodel/user_screen/item_review_viewmodel.dart';

class ItemReviewView extends StatelessWidget {
  const ItemReviewView({super.key, required this.item, required this.index});

  final ItemModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool favorite = item.favorites.contains('Idris Adedeji');
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initClass(item, favorite),
      viewModelBuilder: () => ItemReviewViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        viewModel.onAddToCart(
                            context, item.itemName, item.itemId);
                      },
                      icon: const Icon((Icons.add_shopping_cart)))
                ],
                expandedHeight: 350.h,
                collapsedHeight: 150.h,
                flexibleSpace: PageView.builder(
                  itemCount: item.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          image: DecorationImage(
                              image: NetworkImage(item.images[index]),
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
                        Text3(text: item.brandName),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text3(
                            text: item.ratings.length.toString(), isBold: true),
                        Text3(text: index.toString()),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              viewModel.favorited();
                            },
                            icon: Icon(viewModel.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border)),
                      ],
                    ),
                    Text1(text: item.itemName),
                    Row(
                      children: [
                        if (item.itemPrice != item.newPrice)
                          Text1(
                            text: '\$${item.itemPrice}',
                            color: Colors.red,
                          ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text2(
                          text: '\$${item.newPrice}',
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
                              viewModel.increment(item.itemCount);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.green,
                            )),
                      ],
                    ),
                    Text3(
                      text: item.description,
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
                                  for (int x = 0; x < item.colors.length; x++)
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.pickColor(item.colors[x]);
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(2.r),
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: pickColor(item.colors[x]),
                                            border: Border.all(
                                                color: viewModel.colorPicked ==
                                                        item.colors[x]
                                                    ? Colors.black
                                                    : Colors.grey),
                                          ),
                                          child: Center(
                                            child: Text3(
                                              text: item.colors[x],
                                              color: item.colors[x]
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
                                  for (int x = 0; x < item.sizes.length; x++)
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.pickSize(item.sizes[x]);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(3.r),
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          color: viewModel.sizePicked ==
                                                  item.sizes[x]
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              color: viewModel.sizePicked ==
                                                      item.sizes[x]
                                                  ? Colors.black
                                                  : Colors.grey),
                                        ),
                                        child: Center(
                                            child: Text1(
                                          text: item.sizes[x],
                                          color: viewModel.sizePicked ==
                                                  item.sizes[x]
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
                    viewModel.isLoading == true
                        ? SizedBox(
                            height: 200.h,
                            width: 200.h,
                            child: Center(child: CircularProgressIndicator()))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    viewModel.onAddToCart(
                                        context, item.itemName, item.itemId);
                                  },
                                  child: MyButton(
                                    backgroundColor: Colors.white,
                                    borderColor: Colors.black,
                                    widget: Center(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.card_travel_rounded),
                                          Text1(
                                            text: 'ADD TO CART',
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    )),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    viewModel.onBuyNow(context);
                                  },
                                  child: MyButton(
                                    backgroundColor: Colors.black,
                                    widget: Center(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w),
                                      child: Text1(
                                        text: 'BUY NOW',
                                        color: Colors.white,
                                      ),
                                    )),
                                  )),
                            ],
                          )
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

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.widget,
    required this.backgroundColor,
    this.borderColor = Colors.white,
  });

  final Widget widget;
  final Color backgroundColor;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: widget,
    );
  }
}

Color pickColor(String colorPicked) {
  Color returnColor = Colors.black;
  String color = colorPicked.toLowerCase();
  switch (color) {
    case 'red':
      returnColor = Colors.red;
      break;
    case 'green':
      returnColor = Colors.green;
      break;
    case 'white':
      returnColor = Colors.white;
      break;
    case 'purple':
      returnColor = Colors.purple;
      break;
    case 'pink':
      returnColor = Colors.pink;
      break;
    case 'blue':
      returnColor = Colors.blue;
      break;
    case 'yellow':
      Colors.yellow;
      break;
    case 'orange':
      returnColor = Colors.orange;
      break;
    case 'grey':
      returnColor = Colors.grey;
      break;
    case 'lime':
      returnColor = Colors.lime;
      break;
  }
  return returnColor;
}
