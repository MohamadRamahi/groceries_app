/*import 'package:flutter/material.dart';
import 'package:groceries_app/model/product_card.dart';
import 'package:groceries_app/model/product_model.dart';

class MenuGridWidget extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onFavoriteToggle;
  final Function(Product) onOrderNow;

  const MenuGridWidget({
    super.key,
    required this.products,
    required this.onFavoriteToggle,
    required this.onOrderNow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: products.isEmpty
          ? Center(
        child: CircularProgressIndicator(
          color: theme.primaryColor,
        ),
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 3,
          childAspectRatio: 177 / 250,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductCard(
            item: item,
            onFavoriteToggle: () => onFavoriteToggle(item),
            onOrderNow: () => onOrderNow(item),
          );
        },
      ),
    );
  }
}*/
