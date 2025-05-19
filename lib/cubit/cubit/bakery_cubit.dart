import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BakeryState {}

class BakeryInitial extends BakeryState {}

class BakeryLoaded extends BakeryState {
  final List<Map<String, dynamic>> products;
  BakeryLoaded(this.products);
}

class BakeryCubit extends Cubit<BakeryState> {
  BakeryCubit() : super(BakeryInitial()) {
    loadBakeryProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Bread ",
      "rating": 3.8,
      "price": 0.50,
      "description": "10 pcs, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",
      "image": "assets/image/bread.png"
    },
    {
      "name": "Reef Bread",
      "rating": 4.5,
      "price": 1.25,
      "description": "510 g, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/reef.png"
    },
    {
      "name": "Flour ",
      "rating": 4.5,
      "price": 1.25,
      "description": "1.25 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/flour.png"
    },
    {
      "name": "semolina",
      "rating": 4.5,
      "price": 1.25,
      "description": "1.25 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/semolina.png"
    },
    {
      "name": "Orange Cake",
      "rating": 4.5,
      "price":4.99,
      "description": "2 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/orange_cake.png"
    },
    {
      "name": "Lemon Cake",
      "rating": 4.5,
      "price": 4.99,
      "description": "2 Kg , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/lemon_cake.png"
    },

  ];

  void loadBakeryProducts() {
    List<Map<String, dynamic>> Bakery = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(BakeryLoaded(Bakery));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(BakeryLoaded(filtered));
  }
}
