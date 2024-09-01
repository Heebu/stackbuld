class TransactionHistoryModel {
  final String id;
  final String customer;
  final List contactInfo;
  final List item;
  final String deliveryStatus;
  final String reference;
  final String transactionStatus;
  final String date;
  final num amount;

  const TransactionHistoryModel({
    required this.amount,
    required this.transactionStatus,
    required this.reference,
    required this.date,
    required this.deliveryStatus,
    required this.contactInfo,
    required this.id,
    required this.item,
    required this.customer,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        customer: json['user'] ?? '',
        amount: json['total_amount'] ?? 0,
        id: json['_id'] ?? '',
        transactionStatus: json['transaction_status'] ?? '',
        reference: json['reference'] ?? '',
        date: json['createdAt'] ?? '',
        deliveryStatus: json['delivery_status'] ?? '',
        item: json['items'] ?? [],
        contactInfo: json['contact_information'] ?? [],
      );
}


class ItemInfo {
  final String product;
  final Map<String, dynamic> deliveryOption;
  final num quantity;
  final String deliveryId;

  const ItemInfo({
    required this.product,
    required this.quantity,
    required this.deliveryId,
    required this.deliveryOption,
  });

  factory ItemInfo.fromJson(Map<String, dynamic> json) => ItemInfo(
    deliveryOption: json['delivery_option'] ?? {},
    deliveryId: json['_id'] ?? '',
    quantity: json['quantity'] ?? 0,
    product: json['product'] ?? '',
  );
}

class ContactInfo {
  final String phoneNumber;
  final String address;
  final String deliveryId;

  const ContactInfo({
    required this.phoneNumber,
    required this.address,
    required this.deliveryId,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
    phoneNumber: json['phone_number'] ?? '',
    deliveryId: json['_id'] ?? '',
    address: json['shipping_address'] ?? '',
  );
}