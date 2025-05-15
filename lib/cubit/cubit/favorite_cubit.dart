import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/model/product_model.dart';


class FavoriteProductsCubit extends Cubit<List<Product>> {
  FavoriteProductsCubit() : super([]);

  void addToFavorites(Product product) {
    List<Product> updatedFavorites = List.from(state);
    updatedFavorites.add(product);
    emit(updatedFavorites);
  }

  void removeFromFavorites(Product product) {
    print("Removing product: ${product.name}");
    List<Product> updatedFavorites = List.from(state);
    updatedFavorites.remove(product);
    print("Updated favorites after removal: $updatedFavorites");
    emit(updatedFavorites);  // إصدار الحالة الجديدة
  }
}
