import 'package:stacked/stacked.dart';

import '../../model/item_model.dart';
import '../../services/Helper/item_helper.dart';

class HomeViewmodel extends BaseViewModel {
  List<ItemModel> items = <ItemModel>[];

  getItems() async {
    items = await ItemHelper().getAllItems();
    notifyListeners();
  }

  initClass() async {
    await getItems();
  }
}
