import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BestSellingState {}

class BestSellingInitial extends BestSellingState {}

class BestSellingLoaded extends BestSellingState {
  final List<Map<String, dynamic>> products;
  BestSellingLoaded(this.products);
}

class BestSellingCubit extends Cubit<BestSellingState> {
  BestSellingCubit() : super(BestSellingInitial()) {
    loadBestSelling();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Bell Pepper Red ",
      "rating": 3.8,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "image": "assets/image/bell_pepper1.png"
    },
    {
      "name": "Ginger",
      "rating": 4.5,
      "price": 4.99,
      "description": "250gm, Priceg",
      "image": "assets/image/ginger2.png"
    },
    {
      "name": "Bell Pepper Red ",
      "rating": 3.8,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "image": "assets/image/bell_pepper1.png"
    },
    {
      "name": "Ginger",
      "rating": 4.5,
      "price": 4.99,
      "description": "250gm, Priceg",
      "image": "assets/image/ginger2.png"
    },
  ];

  void loadBestSelling() {
    List<Map<String, dynamic>> topRated = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(BestSellingLoaded(topRated));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(BestSellingLoaded(filtered));
  }
}
