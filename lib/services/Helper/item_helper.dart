import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/reuseable/Widgets/app_properties.dart';
import '../../model/cart_model.dart';
import '../../model/item_model.dart';

class ItemHelper {
  final itemDirectory = FirebaseFirestore.instance.collection('Items');
  final cartDirectory = FirebaseFirestore.instance.collection('Carts');

  //get one item
  Future<ItemModel> getOneItems(itemId) async {
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

    try {
      final snapshot = await itemDirectory.doc(itemId).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        return ItemModel(
          itemName: data['itemName'] ?? '',
          itemType: data['itemType'] ?? '',
          itemId: data['itemId'] ?? '',
          description: data['description'] ?? '',
          brandName: data['brandName'] ?? '',
          colors: List<String>.from(data['colors'] ?? []),
          favorites: List<String>.from(data['favorites'] ?? []),
          images: List<String>.from(data['images'] ?? []),
          itemPrice: data['itemPrice'] ?? 0,
          itemCount: data['itemCount'] ?? 0,
          newPrice: data['newPrice'] ?? 0,
          ratings: List<dynamic>.from(data['ratings'] ?? []),
          sizes: List<String>.from(data['sizes'] ?? []),
        );
      }
    } catch (e) {
      print('error: $e');
    }
    return item;
  }

  //get all Items
  Future<List<ItemModel>> getAllItems() async {
    List<ItemModel> items = <ItemModel>[];
    try {
      final incomingItems = await itemDirectory.get();
      items = incomingItems.docs
          .map((doc) => ItemModel.toJson(doc.data()))
          .toList();
    } catch (e) {
      print('error: $e');
    }
    return items;
  }

// get Item by type
  Future<List<ItemModel>> getAllItemsByType(String type) async {
    List<ItemModel> items = <ItemModel>[];
    try {
      final incomingItems = await itemDirectory
          .where('userTypes', arrayContains: type.toLowerCase())
          .get();
      items = incomingItems.docs
          .map((doc) => ItemModel.toJson(doc.data()))
          .toList();
    } catch (e) {
      print('error: $e');
    }
    return items;
  }

  //like item
  likeItems(List likes, itemId) async {
    try {
      await itemDirectory.doc(itemId).set({'favorites': likes});
    } catch (e) {
      print('error: $e');
    }
  }

  //get Items in cart
  Future<List<CartModel>> getCartItems() async {
    List<CartModel> cartItems = <CartModel>[];
    final incomingItems = await cartDirectory
        .where('userId', isEqualTo: AppProperties.userId)
        .get();
    cartItems =
        incomingItems.docs.map((doc) => CartModel.toJson(doc.data())).toList();
    return cartItems;
  }

//add Item ToCart
  Future<String> addItemToCart(CartModel itemDetails) async {
    String result = 'error';
    try {
      await cartDirectory.doc(itemDetails.orderId).set({
        'itemName': itemDetails.itemName,
        'userId': AppProperties.userId,
        'orderId': itemDetails.orderId,
        'color': itemDetails.color,
        'itemCount': itemDetails.itemCount,
        'itemId': itemDetails.itemId,
        'size': itemDetails.size,
        'userName': AppProperties.appName,
        'timestamp': Timestamp.now()
      });
      result = 'success';
    } catch (e) {
      result = e.toString();
      print('error: $e');
    }
    return result;
  }

//delete Items from cart
  Future<String> deleteItemToCart(String orderId) async {
    String result = 'error';
    try {
      await cartDirectory.doc(orderId).delete();
      result = 'success';
    } catch (e) {
      result = e.toString();
      print('error: $e');
    }
    return result;
  }

//edit items in cart
  Future<String> updateItemToCart(
      String color, int itemCount, String size, String orderId) async {
    String result = 'error';
    try {
      await cartDirectory.doc(orderId).update({
        'color': color,
        'size': size,
        'itemCount': itemCount,
      });
      result = 'success';
    } catch (e) {
      result = e.toString();
      print('error: $e');
    }
    return result;
  }
}
