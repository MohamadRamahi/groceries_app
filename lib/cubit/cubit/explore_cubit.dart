import 'package:bloc/bloc.dart';
import 'package:groceries_app/cubit/cubit/explore_state.dart';
import 'package:groceries_app/model/product2.dart';

class ExplorerCubit extends Cubit<ExplorerState> {
  ExplorerCubit() : super(ExplorerInitial());

  void loadProducts() {
    final List<Product2> products = List.generate(6, (index) {
      final names = [
        'Fresh Fruits \n & Vegetables',
        'Cooking Iil \n & Ghee ',
        'Meat & Fish',
        'Bakery & Snacks',
        'Diary & Eggs',
        'Beverage',
      ];
      final images = [
        'assets/image/vegetable-basket.png',
        'assets/image/cooking-oils.png',
        'assets/image/fish2.png',
        'assets/image/bakery.png',
        'assets/image/diary_and eggs.png',
        'assets/image/beverage2.png',
      ];

      return Product2(
        name1: names[index],
        image1: images[index],

      );
    });

    emit(ExplorerLoaded(products));
  }
}
