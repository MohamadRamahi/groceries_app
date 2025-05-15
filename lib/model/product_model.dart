class Product {
  final String name;
  final String description;
  final String description1;

  final double price;
  final String image;
  final String images;
  bool isFavorite; // ✅ قابل للتغيير الآن (ليس final)

  Product({
    required this.name,
    required this.description,
    required this.description1,

    required this.price,
    required this.image,
    required this.images,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      images: json['images'] ?? '',
      description1:json['description1']??'',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  // ✅ يمكن أيضاً إضافة نسخة جديدة مع تغيير isFavorite إن أردت استخدام النسخ بدلاً من التعديل المباشر
  Product copyWith({
    bool? isFavorite,
  }) {
    return Product(
      name: this.name,
      description: this.description,
      price: this.price,
      image: this.image,
      images: this.images,
      description1:this.description1,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
