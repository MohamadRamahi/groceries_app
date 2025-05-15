import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MeatAndChikenState {}

class MeatAndChikenInitial extends MeatAndChikenState {}

class MeatAndChikenLoaded extends MeatAndChikenState {
  final List<Map<String, dynamic>> products;
  MeatAndChikenLoaded(this.products);
}

class MeatAndChikenCubit extends Cubit<MeatAndChikenState> {
  MeatAndChikenCubit() : super(MeatAndChikenInitial()) {
    loadMeatAndChiken();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Beef Bone ",
      "rating": 3.8,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "image": "assets/image/beef_bone.png"
    },
    {
      "name": "Broiler Chicken",
      "rating": 4.5,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "image": "assets/image/chicken.png"
    },
    {
      "name": "Seafood Meat  ",
      "rating": 3.8,
      "price": 4.99,
      "description": "1 Kg, Priceg",
      "image": "assets/image/fish2.png"
    },

  ];

  void loadMeatAndChiken() {
    List<Map<String, dynamic>> topRated = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(MeatAndChikenLoaded(topRated));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(MeatAndChikenLoaded(filtered));
  }
}
