import 'package:stacked/stacked.dart';

import '../../model/item_model.dart';

class ItemReviewViewmodel extends BaseViewModel {
  String colorPicked = '';
  String sizePicked = '';
  bool isFavorite = false;
  bool isLoading = false;

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

  onAddToCart() async {
    isLoading = true;
    notifyListeners();

    ///do something here
    isLoading = false;
    notifyListeners();
  }

  onBuyNow() async {
    isLoading = true;
    notifyListeners();

    ///do something here
    isLoading = false;
    notifyListeners();
  }

  initClass(ItemModel item, favorite) async {
    isFavorite = favorite;
    notifyListeners();
  }
}
