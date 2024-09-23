class Product {
  final String title;
  final String thumbnail;
  final double price;
  final String brand;
  final double rating;
  final String description;
  final List<String> images;

  Product({
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.brand,
    required this.rating,
    required this.description,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      brand: json['brand'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }
}