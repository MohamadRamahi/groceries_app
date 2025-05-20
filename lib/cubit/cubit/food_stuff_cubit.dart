/*import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FoodStuffState {}

class FoodStuffInitial extends FoodStuffState {}

class FoodStuffLoaded extends FoodStuffState {
  final List<Map<String, dynamic>> products;
  FoodStuffLoaded(this.products);
}

class FoodStuffCubit extends Cubit<FoodStuffState> {
  FoodStuffCubit() : super(FoodStuffInitial()) {
    loadFoodStuffProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Oil Afia ",
      "rating": 3.8,
      "price": 2.5,
      "description": "3 L, Price",
      "description1":  "Mangoes are nutritious and may support weight loss. ",
      "image": "assets/image/oils2.png"
    },
    {
      "name": "Rice Mustafa",
      "rating": 4.5,
      "price": 2.99,
      "description": "4 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/rice2.png"
    },
    {
      "name": "Halawah ",
      "rating": 4.5,
      "price": 0.99,
      "description": "250 g, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/halawah.png"
    },
    {
      "name": "Tea AL Ghazaleen",
      "rating": 4.5,
      "price": 1.5,
      "description": "100 medals, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/tea.png"
    },
    {
      "name": "Coffee Alameed",
      "rating": 4.5,
      "price": 3.99,
      "description": "250 g , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/coffee.png"
    },
    {
      "name": "Honey ",
      "rating": 4.5,
      "price": 9.99,
      "description": "1 Kg , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/honey.png"
    },

  ];

  void loadFoodStuffProducts() {
    List<Map<String, dynamic>> FoodStuff = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(FoodStuffLoaded(FoodStuff));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(FoodStuffLoaded(filtered));
  }
}
*/