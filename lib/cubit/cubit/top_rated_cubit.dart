import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final List<Map<String, dynamic>> products;
  TopRatedLoaded(this.products);
}

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial()) {
    loadTopRatedProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Organic bananas",
      "rating": 3.8,
      "price": 4.99,
      "description": "7 pcs, Priceg",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",
      "image": "assets/image/bananas.png"
    },
    {
      "name": "Red Apple",
      "rating": 4.5,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/red_apple.png"
    },
    {
      "name": "Organic bananas",
      "rating": 3.8,
      "price": 4.99,
      "description": "7 pcs, Priceg",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/bananas.png"
    },
    {
      "name": "Red Apple",
      "rating": 4.5,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/red_apple.png"
    },
  ];

  void loadTopRatedProducts() {
    List<Map<String, dynamic>> topRated = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(TopRatedLoaded(topRated));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(TopRatedLoaded(filtered));
  }
}
