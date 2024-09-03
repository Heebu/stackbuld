import 'package:stackbuld/core/reuseable/Widgets/snack_bars.dart';
import 'package:stackbuld/model/cart_model.dart';
import 'package:stackbuld/services/Helper/item_helper.dart';
import 'package:stacked/stacked.dart';

class AllCartViewmodel extends BaseViewModel {
  List<CartModel> myCart = <CartModel>[];

  deleteCart(context, cartId) async {
    String result = await ItemHelper().deleteItemToCart(cartId);
    if (result == 'success') {
      await getMyCart();
      showSnackBar(context, 'Item Deleted');
    } else {
      showSnackBar(context, result);
    }
  }

  getMyCart() async {
    myCart = await ItemHelper().getCartItems();
    notifyListeners();
  }
}
