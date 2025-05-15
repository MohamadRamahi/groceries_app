import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/model/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  CartItem copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CartItem &&
              runtimeType == other.runtimeType &&
              product.name == other.product.name;

  @override
  int get hashCode => product.name.hashCode;
}

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  Future<void> addToCart({
    required Product product,
    required int quantity,
  }) async {
    final index = state.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      // If the product is already in the cart, update the quantity
      final updatedItem = state[index].copyWith(
        quantity: state[index].quantity + quantity,
      );
      final updatedList = List<CartItem>.from(state);
      updatedList[index] = updatedItem;
      emit(updatedList);
    } else {
      // If the product is not in the cart, add it
      emit([
        ...state,
        CartItem(product: product, quantity: quantity),
      ]);
    }

    // Debugging line to check if the item was added
    print("Cart items after add: ${state.length} items");
  }

  void removeFromCart(CartItem itemToRemove) {
    emit(state.where((item) => item != itemToRemove).toList());
  }

  void clearCart() {
    emit([]);
  }

  void updateQuantity(CartItem item, int newQuantity) {
    if (newQuantity < 1) return;

    final updatedItem = item.copyWith(quantity: newQuantity);
    final updatedCart = state.map((i) {
      return i.product.name == item.product.name ? updatedItem : i;
    }).toList();
    emit(updatedCart);
  }

  double get subTotal {
    return state.fold(
      0.0,
          (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  double totalWithCharges({double deliveryCharge = 3.0, double discount = 2.0}) {
    return subTotal + deliveryCharge - discount;
  }
}
