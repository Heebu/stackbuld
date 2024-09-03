import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String itemName;
  final String itemId;
  final String userName;
  final String userId;
  final String orderId;
  final String color;
  final String size;
  final int itemCount;
  final Timestamp timestamp;

  const CartModel({
    required this.itemName,
    required this.userId,
    required this.orderId,
    required this.color,
    required this.itemCount,
    required this.itemId,
    required this.size,
    required this.userName,
    required this.timestamp,
  });

  factory CartModel.toJson(Map<String, dynamic> map) {
    return CartModel(
      itemName: map['itemName'] ?? '',
      userName: map['userName'] ?? '',
      size: map['size'] ?? '',
      color: map['color'] ?? '',
      itemId: map['itemId'],
      orderId: map['orderId'],
      itemCount: map['itemCount'],
      userId: map['userId'],
      timestamp: map['timestamp'],
    );
  }
}
