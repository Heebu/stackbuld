import 'package:flutter/cupertino.dart';
import 'package:stackbuld/core/reuseable/Widgets/snack_bars.dart';
import 'package:stackbuld/services/Helper/item_helper.dart';
import 'package:stacked/stacked.dart';

import '../../model/item_model.dart';

class EditCartViewmodel extends BaseViewModel {
  ItemModel item = ItemModel(
      itemName: 'itemName',
      itemType: 'itemType',
      itemId: 'itemId',
      description: '',
      brandName: 'brandName',
      colors: ['black'],
      favorites: [],
      images: [],
      itemPrice: 0,
      itemCount: 0,
      newPrice: 0,
      ratings: [],
      sizes: []);

  String colorPicked = '';
  String sizePicked = '';
  int itemCount = 1;
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

  getItem(itemId) async {
    item = await ItemHelper().getOneItems(itemId);
    notifyListeners();
  }

  editItem(context, orderId) async {
    if (colorPicked == '') {
      showSnackBar(context, 'Pick a color');
    } else if (sizePicked == '') {
      showSnackBar(context, 'Pick a size');
    } else {
      String result = await ItemHelper()
          .updateItemToCart(colorPicked, itemCount, sizePicked, orderId);
      if (result == 'success') {
        showSnackBar(context, 'cart edited');
        Navigator.pop(context);
      } else {
        showSnackBar(context, result);
      }
    }
  }

  initClass(itemId) async {
    await getItem(itemId);
  }
}
