abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final List<Map<String, dynamic>> products;
  AllProductsLoaded(this.products);
}
