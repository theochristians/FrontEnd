class Product {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String? discountedPrice; // Harga diskon opsional

  Product({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.discountedPrice,
  });

  // Factory untuk parsing dari JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      discountedPrice: json['discountedPrice'],
    );
  }

  // Konversi ke JSON (jika perlu)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'discountedPrice': discountedPrice,
    };
  }
}
