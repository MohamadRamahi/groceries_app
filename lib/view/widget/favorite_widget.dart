import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/favorite_cubit.dart';
import 'package:groceries_app/model/product_model.dart';
import 'package:groceries_app/responsive.dart';

class FavoriteWidget extends StatelessWidget {
  final Product item;
  final VoidCallback onFavoriteToggle; // 👈 أضف هذا السطر

  const FavoriteWidget({
    super.key,
    required this.item,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<FavoriteProductsCubit>().state.contains(item);

    return IconButton(
      style: ButtonStyle(

        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsiveWidth(context, 3)),
          ),
        ),
      ),
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.green,
        size: responsiveWidth(context, 24),
      ),
      onPressed: () {
        final cubit = context.read<FavoriteProductsCubit>();
        if (isFavorite) {
          cubit.removeFromFavorites(item);
        } else {
          cubit.addToFavorites(item);
        }
      },
    );
  }
}
