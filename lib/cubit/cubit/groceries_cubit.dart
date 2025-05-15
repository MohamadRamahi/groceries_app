import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GroceriesCubitState {}

class GroceriesCubitInitial extends GroceriesCubitState {}

class GroceriesCubitLoaded extends GroceriesCubitState {
  final List<Map<String, dynamic>> products;
  GroceriesCubitLoaded(this.products);
}

class GroceriesCubit extends Cubit<GroceriesCubitState> {
  GroceriesCubit() : super(GroceriesCubitInitial()) {
    loadGroceriesCubit();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Pulse ",
      "rating": 3.8,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "image": "assets/image/pulse.png"
    },
    {
      "name": "Rice",
      "rating": 4.5,
      "price": 4.99,
      "description": "250gm, Priceg",
      "image": "assets/image/rice.png"
    },

    {
      "name": "Meat and Fish",
      "rating": 4.5,
      "price": 4.99,
      "description": "250gm, Priceg",
      "image": "assets/image/fish2.png"
    },
  ];

  void loadGroceriesCubit() {
    List<Map<String, dynamic>> topRated = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(GroceriesCubitLoaded(topRated));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(GroceriesCubitLoaded(filtered));
  }
}
