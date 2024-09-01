class ItemModel {
  final String itemName;
  final String brandName;
  final String description;
  final List colors;
  final List sizes;
  final List images;
  final double itemPrice;
  final double newPrice;
  final List favorites;
  final List ratings;

  const ItemModel({
    required this.itemName,
    required this.description,
    required this.brandName,
    required this.colors,
    required this.favorites,
    required this.images,
    required this.itemPrice,
    required this.newPrice,
    required this.ratings,
    required this.sizes,
  });

  factory ItemModel.toJson(Map<String, dynamic> map) {
    return ItemModel(
      itemName: map['itemName'] ?? '',
      description: map['description'] ?? '',
      brandName: map['brandName'] ?? '',
      colors: map['colors'] ?? [],
      favorites: map['favorites'],
      images: map['images'],
      itemPrice: map['itemPrice'],
      newPrice: map['newPrice'],
      ratings: map['ratings'],
      sizes: map['sizes'],
    );
  }
}
