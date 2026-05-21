class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final List<String> sizes;
  final String description;
  bool isWishlisted;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.description,
    this.isWishlisted = false,
  });
}
