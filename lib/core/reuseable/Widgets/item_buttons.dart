import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/item_model.dart';
import '../../../views/user_screen/HomeScreen/item_review_view.dart';
import 'mainTextWidget.dart';

class MyItemBox extends StatelessWidget {
  const MyItemBox({
    super.key,
    required this.itemModel,
    required this.index,
  });

  final ItemModel itemModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    //this rating still needs proper calculation
    String itemRating = itemModel.ratings.length.toString();

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ItemReviewView(item: itemModel, index: index),
            ));
      },
      child: SizedBox(
          width: 170.w,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          topLeft: Radius.circular(10.r))),
                  height: 150.h,
                  child: Stack(children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                  image: NetworkImage(itemModel.images[0]))),
                        )),
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton.filledTonal(
                            onPressed: () {
                              itemModel.favorites.contains('Idris Adedeji')
                                  ? itemModel.favorites.remove('Idris Adedeji')
                                  : itemModel.favorites.add('Idris Adedeji');
                            },
                            icon: itemModel.favorites.contains('Idris Adedeji')
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border)))
                  ])),
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text3(text: itemModel.brandName),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text3(text: itemRating, isBold: true),
                          Text3(text: index.toString()),
                        ],
                      ),
                      Text1(text: itemModel.itemName),
                      Row(
                        children: [
                          if (itemModel.itemPrice != itemModel.newPrice)
                            Text1(
                              text: '\$${itemModel.itemPrice}',
                              color: Colors.red,
                            ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text2(
                            text: '\$${itemModel.newPrice}',
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
