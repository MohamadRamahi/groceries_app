import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FreshFrutesState {}

class FreshFrutesInitial extends FreshFrutesState {}

class FreshFrutesLoaded extends FreshFrutesState {
  final List<Map<String, dynamic>> products;
  FreshFrutesLoaded(this.products);
}

class FreshFrutesCubit extends Cubit<FreshFrutesState> {
  FreshFrutesCubit() : super(FreshFrutesInitial()) {
    loadFreshFrutesProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Mango ",
      "rating": 3.8,
      "price": 1.5,
      "description": "1.5 Kg, Price",
      "description1":  "Mangoes are nutritious and may support weight loss. ",
      "image": "assets/image/mango_png.png"
    },
    {
      "name": "Bananas",
      "rating": 4.5,
      "price": 4.99,
      "description": "7 pcs, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/bananas.png"
    },
    {
      "name": "Red Apple ",
      "rating": 4.5,
      "price": 0.99,
      "description": "1 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/red_apple.png"
    },
    {
      "name": "Orange",
      "rating": 4.5,
      "price": 0.99,
      "description": "1.5 kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/orange.png"
    },
    {
      "name": "Tomato",
      "rating": 4.5,
      "price": 2.00,
      "description": "1.4L , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/tomato.png"
    },
    {
      "name": "Grape ",
      "rating": 4.5,
      "price": 1.5,
      "description": "1 Kg , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/grape1.png"
    },

  ];

  void loadFreshFrutesProducts() {
    List<Map<String, dynamic>> FreshFrutes = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(FreshFrutesLoaded(FreshFrutes));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(FreshFrutesLoaded(filtered));
  }
}
