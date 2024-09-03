import 'package:stacked/stacked.dart';

import '../../model/item_model.dart';
import '../../services/Helper/item_helper.dart';

class SearchViewmodel extends BaseViewModel {
  List<ItemModel> items = <ItemModel>[];
  String itemTypeFilter = '';
  String itemSizeFilter = '';
  String itemColorFilter = '';

  onSearch(value) async {
    items = items
        .where(
            (item) => item.itemName.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  onTypeFilter(filter) async {
    await getItems();
    items = (items
        .where((item) =>
        item.itemType.toLowerCase().contains(filter.toLowerCase())).toList()
        +
        items.where((item) => item.sizes.contains(filter)).toList()
        +
        items.where((item) => item.colors.contains(filter)).toList()
    );
    notifyListeners();
  }


  getItems() async {
    items = await ItemHelper().getAllItems();
    notifyListeners();
  }

  initClass() async {
    await getItems();
  }
}
