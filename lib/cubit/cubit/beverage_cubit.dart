import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BeverageState {}

class BeverageInitial extends BeverageState {}

class BeverageLoaded extends BeverageState {
  final List<Map<String, dynamic>> products;
  BeverageLoaded(this.products);
}

class BeverageCubit extends Cubit<BeverageState> {
  BeverageCubit() : super(BeverageInitial()) {
    loadBeverageProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Kinza Diet ",
      "rating": 3.8,
      "price": 0.40,
      "description": "355ml, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",
      "image": "assets/image/kinza_diet.png"
    },
    {
      "name": "Kinza Cola",
      "rating": 4.5,
      "price": 0.40,
      "description": "355ml, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/kinza_cola.png"
    },
    {
      "name": "Mango Juice ",
      "rating": 4.5,
      "price": 0.5,
      "description": "355ml, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/mango_juice2.png"
    },
    {
      "name": "Orange Juice",
      "rating": 4.5,
      "price": 0.99,
      "description": "1.5L, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/orange_juice2.png"
    },
    {
      "name": "Apple Juice",
      "rating": 4.5,
      "price": 2.00,
      "description": "1.4L , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/apple_juice.png"
    },
    {
      "name": "Berry Juice",
      "rating": 4.5,
      "price": 2.00,
      "description": "1.4L , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/berry_juice.jpg"
    },

  ];

  void loadBeverageProducts() {
    List<Map<String, dynamic>> Beverage = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(BeverageLoaded(Beverage));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(BeverageLoaded(filtered));
  }
}
