import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DiaryState {}

class DiaryInitial extends DiaryState {}

class DiaryLoaded extends DiaryState {
  final List<Map<String, dynamic>> products;
  DiaryLoaded(this.products);
}

class DiaryCubit extends Cubit<DiaryState> {
  DiaryCubit() : super(DiaryInitial()) {
    loadDiaryProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Eggs ",
      "rating": 3.8,
      "price": 2.75,
      "description": "900 g, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",
      "image": "assets/image/eggs.png"
    },
    {
      "name": "Triangle Cheese",
      "rating": 4.5,
      "price": 0.5,
      "description": "150 g, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/triangle_cheese.png"
    },
    {
      "name": "Panda cheese ",
      "rating": 4.5,
      "price": 2.99,
      "description": "500 g, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/cheese_panad.png"
    },
    {
      "name": "Shaneineh",
      "rating": 4.5,
      "price": 0.99,
      "description": "950 ml, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/shaneineh.png"
    },
    {
      "name": "Jameed Alkaseeh",
      "rating": 4.5,
      "price":2.50,
      "description": "500 g, Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/jameed.png"
    },
    {
      "name": "Alyoum yogurt",
      "rating": 4.5,
      "price": 1.25,
      "description": "1 Kg , Price",
      "description1":  "Apples are nutritious. Apples may be good for weight loss. ",

      "image": "assets/image/alyoum-fresh-yogurt.png.png"
    },

  ];

  void loadDiaryProducts() {
    List<Map<String, dynamic>> Diary = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(DiaryLoaded(Diary));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(DiaryLoaded(filtered));
  }
}
