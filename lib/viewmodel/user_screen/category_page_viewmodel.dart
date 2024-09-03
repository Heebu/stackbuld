import 'package:stacked/stacked.dart';

import '../../model/item_model.dart';
import '../../services/Helper/item_helper.dart';

class CategoryPageViewmodel extends BaseViewModel {
  List<ItemModel> items = <ItemModel>[];

  getItems(type) async {
    items = await ItemHelper().getAllItemsByType(type);
    notifyListeners();
  }


//items = items
//         .where(
//             (item) => item.itemName.toLowerCase().contains(value.toLowerCase()))
//         .toList();
}
