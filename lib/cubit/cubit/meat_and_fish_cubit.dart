/*import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MeatAndFishState {}

class MeatAndFishInitial extends MeatAndFishState {}

class MeatAndFishLoaded extends MeatAndFishState {
  final List<Map<String, dynamic>> products;
  MeatAndFishLoaded(this.products);
}

class MeatAndFishCubit extends Cubit<MeatAndFishState> {
  MeatAndFishCubit() : super(MeatAndFishInitial()) {
    loadMeatAndFishProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Beef Bone ",
      "rating": 3.8,
      "price": 7.00,
      "description": "1 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",
      "image": "assets/image/beef_bone.png"
    },
    {
      "name": "Chicken",
      "rating": 4.5,
      "price": 1.99,
      "description": "1 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/chicken.png"
    },
    {
      "name": "Braim fish",
      "rating": 4.5,
      "price": 5.50,
      "description": "1 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/braim_fish.png"
    },
    {
      "name": "Sardines",
      "rating": 4.5,
      "price": 3.99,
      "description": "1 kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/sardenes1.png"
    },
    {
      "name": "Shrimp",
      "rating": 4.5,
      "price": 12.99,
      "description": "1 Kg , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/shrimp.png"
    },
    {
      "name": "fillet",
      "rating": 4.5,
      "price": 2.50,
      "description": "1 Kg, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/fillet.png"
    },

  ];

  void loadMeatAndFishProducts() {
    List<Map<String, dynamic>> MeatAndFish = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(MeatAndFishLoaded(MeatAndFish));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(MeatAndFishLoaded(filtered));
  }
}
*/