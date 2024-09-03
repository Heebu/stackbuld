class ItemModel {
  final String itemName;
  final String itemType;
  final String itemId;
  final String brandName;
  final String description;
  final List colors;
  final List sizes;
  final List images;
  final int itemPrice;
  final int newPrice;
  final int itemCount;
  final List favorites;
  final List ratings;

  const ItemModel({
    required this.itemName,
    required this.itemType,
    required this.itemId,
    required this.description,
    required this.brandName,
    required this.colors,
    required this.favorites,
    required this.images,
    required this.itemPrice,
    required this.itemCount,
    required this.newPrice,
    required this.ratings,
    required this.sizes,
  });

  factory ItemModel.toJson(Map<String, dynamic> map) {
    return ItemModel(
      itemName: map['itemName'] ?? '',
      itemType: map['itemType'] ?? '',
      itemId: map['itemId'] ?? '',
      description: map['description'] ?? '',
      brandName: map['brandName'] ?? '',
      colors: map['colors'] ?? [],
      favorites: map['favorites'] ?? [],
      images: map['images'] ?? [],
      itemPrice: map['itemPrice'] ?? 0,
      newPrice: map['newPrice'] ?? 0,
      itemCount: map['itemCount'] ?? 0,
      ratings: map['ratings'] ?? [],
      sizes: map['sizes'] ?? [],
    );
  }
}
