class ProductModel {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      coverPictureUrl: json['coverPictureUrl'],
      price: json['price'],
    );
  }
}
