import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/all_product_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());

  final Map<String, List<Map<String, dynamic>>> allProductsByCategory = {
    "fruits": [
      {
        "name": "Mango",
        "rating": 3.8,
        "price": 1.5,
        "description": "1.5 Kg, Price",
        "image": "assets/image/mango_png.png"
      },
      {
        "name": "Bananas",
        "rating": 4.5,
        "price": 4.99,
        "description": "7 pcs, Price",
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
    ],


    "meat": [
      {
        "name": "Beef Bone",
        "rating": 3.8,
        "price": 7.00,
        "description": "1 Kg, Price",
        "image": "assets/image/beef_bone.png"
      },
      {
        "name": "Chicken",
        "rating": 4.5,
        "price": 1.99,
        "description": "1 Kg, Price",
        "image": "assets/image/chicken.png"
      },
      {
        "name": "Seafood Meat  ",
        "rating": 3.8,
        "price": 4.99,
        "description": "1 Kg, Priceg",
        "image": "assets/image/fish2.png"
      },
    ],


    "groceries": [
      {
        "name": "Pulse",
        "rating": 3.8,
        "price": 4.99,
        "description": "1 Kg, Price",
        "image": "assets/image/pulse.png"
      },
      {
        "name": "Rice",
        "rating": 4.5,
        "price": 2.99,
        "description": "4 Kg, Price",
        "image": "assets/image/rice2.png"
      },
      {
        "name": "Meat and Fish",
        "rating": 4.5,
        "price": 4.99,
        "description": "250gm, Priceg",
        "image": "assets/image/fish2.png"
      },

    ],
    "bakery":[
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
    ],
    "food stuff":[
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
    ],

    "meat and fish":[
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
    ],
    "diary":[
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
    ],
    "beverage":[
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

    ]


  };
  List<Map<String, dynamic>> _currentProducts = [];

  void loadProductsByCategory(String category) {
    final products = allProductsByCategory[category] ?? [];
    _currentProducts = products;
    emit(AllProductsLoaded(products));
  }

  void search(String query) {
    final filtered = _currentProducts.where((product) {
      return product["name"]
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
    emit(AllProductsLoaded(filtered));
  }

}
