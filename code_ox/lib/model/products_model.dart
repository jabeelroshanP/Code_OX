class ProductsModel {
  int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String? image;

  ProductsModel({
     this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    this.image,
  });

  factory ProductsModel.fromjson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      price: json['price'] ?? "",
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
