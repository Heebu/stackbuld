import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stackbuld/core/reuseable/Widgets/app_properties.dart';
import 'package:stackbuld/core/reuseable/Widgets/snack_bars.dart';
import 'package:stackbuld/model/cart_model.dart';
import 'package:stackbuld/services/Helper/item_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../../model/item_model.dart';

class ItemReviewViewmodel extends BaseViewModel {
  String colorPicked = '';
  String sizePicked = '';
  int itemCount = 1;
  bool isFavorite = false;
  bool isLoading = false;

  increment(maxCount) {
    if (itemCount < maxCount) {
      itemCount++;
      notifyListeners();
    }
  }

  decrement() {
    if (itemCount >= 1) {
      itemCount--;
      notifyListeners();
    }
  }

  pickSize(String size) {
    sizePicked = size;
    notifyListeners();
  }

  pickColor(String color) {
    colorPicked = color;
    notifyListeners();
  }

  favorited() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  onAddToCart(
    context,
    itemName,
    itemId,
  ) async {
    isLoading = true;
    notifyListeners();

    if (colorPicked == '') {
      showSnackBar(context, 'Pick a color');
    } else if (sizePicked == '') {
      showSnackBar(context, 'Pick a size');
    } else {
      const uuid = Uuid();
      CartModel cartModel = CartModel(
          itemName: itemName,
          userId: AppProperties.userId,
          orderId: uuid.v8(),
          color: colorPicked,
          itemCount: itemCount,
          itemId: itemId,
          size: sizePicked,
          userName: AppProperties.appName,
          timestamp: Timestamp.now());

      String result = await ItemHelper().addItemToCart(cartModel);
      if (result == 'success') {
        showSnackBar(context, 'Item added to cart');
        Navigator.pop(context);
      } else {
        showSnackBar(context, result);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  onBuyNow(context) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(
      const Duration(seconds: 3),
      () => showSnackBar(context, 'Item has been buoght'),
    );
    isLoading = false;
    notifyListeners();
  }

  initClass(ItemModel item, favorite) async {
    isFavorite = favorite;
    notifyListeners();
  }
}
