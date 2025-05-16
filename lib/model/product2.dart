class Product2 {
  final String name1;
  final String image1;


  Product2({
    required this.name1,
    required this.image1,

  });
  factory Product2.fromJson(Map<String, dynamic> json) {
    return Product2(
      name1: json['name1'] ?? '',

      image1: json['image1'] ?? '',

    );
  }
}
