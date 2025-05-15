// favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/favorite_cubit.dart';
import 'package:groceries_app/model/product_model.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المفضلة"),
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<FavoriteProductsCubit, List<Product>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return Center(child: Text("لا توجد منتجات مفضلة"));
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
              return ListTile(
                leading: Image.asset(product.image, width: 50, height: 50),
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                trailing: Icon(Icons.favorite, color: Colors.green),
              );
            },
          );
        },
      ),
    );
  }
}
