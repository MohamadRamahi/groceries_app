import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/favorite_cubit.dart';
import 'package:groceries_app/cubit/cubit/cart_cubit.dart'; // ✅ Import your CartCubit
import 'package:groceries_app/model/product_model.dart';
import 'package:groceries_app/responsive.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: responsiveHeight(context, 8)),
            child: Text(
              'My Favorites',
              style: TextStyle(
                fontSize: responsiveWidth(context, 22),
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ),
      ),

      body: BlocBuilder<FavoriteProductsCubit, List<Product>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 100, color: Colors.grey),
                  SizedBox(height: responsiveHeight(context, 16)),
                  Text(
                    'No Favorite Items',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 8)),
                  Text(
                    'You haven’t added any items to your favorites yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 14),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 16),
              vertical: responsiveHeight(context, 16),
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == favorites.length - 1 ? 0 : responsiveHeight(context, 20),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                product.image,
                                width: responsiveWidth(context, 58),
                                height: responsiveWidth(context, 58),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: responsiveWidth(context, 12)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: responsiveWidth(context, 15),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: responsiveHeight(context, 4)),
                                  Text(
                                    product.description,
                                    style: TextStyle(
                                      fontSize: responsiveWidth(context, 13),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: responsiveHeight(context, 8)),
                                  Text(
                                    '\$${product.price}',
                                    style: TextStyle(
                                      fontSize: responsiveWidth(context, 16),
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.favorite, color: Colors.green),
                            onPressed: () {
                              context.read<FavoriteProductsCubit>().removeFromFavorites(product);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveHeight(context, 12)),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    SizedBox(height: responsiveHeight(context, 12)),
                  ],
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<FavoriteProductsCubit, List<Product>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) return SizedBox.shrink();

          return Padding(
            padding: EdgeInsets.all(responsiveWidth(context, 16)),
            child: SizedBox(
              width: double.infinity,
              height: responsiveHeight(context, 56),
              child: ElevatedButton(
                onPressed: () {
                  final cartCubit = context.read<CartCubit>();
                  for (final product in favorites) {
                    cartCubit.addToCart(product: product, quantity: 1); // 👈 Works as intended
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('All favorite items added to cart'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add All to Cart',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
