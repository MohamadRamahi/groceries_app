import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/best_selling_cubit.dart';
import 'package:groceries_app/cubit/cubit/groceries_cubit.dart';

class GroceriesWidget extends StatelessWidget {
  const GroceriesWidget({Key? key}) : super(key: key);

  final List<Color> cardColors = const [
    Color(0xffF8A44C),
    Color(0xff53B175),
    Color(0xffD6E4FF),
    Color(0xffFDE2E4),
    Color(0xffFFFACD),
    Color(0xffE0BBE4),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => GroceriesCubit(),
      child: SizedBox(
        height: 110,
        child: BlocBuilder<GroceriesCubit, GroceriesCubitState>(
          builder: (context, state) {
            if (state is GroceriesCubitLoaded) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  final color = cardColors[index % cardColors.length]; // Cycle through colors
                  return _buildProductCard(screenWidth, product, context, color);
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(double screenWidth, Map<String, dynamic> product, BuildContext context, Color borderColor) {
    return SizedBox(
      width: 250,
      height: 90,
      child: Card(
        color: borderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xffDBF4D1)),
        ),
        child: Row(
          children: [
            _buildProductImage(product),
            Expanded(
              child: _buildProductDetails(screenWidth, product, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Map<String, dynamic> product) {
    return Container(
      width: 80,
      height: double.infinity,
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          product["image"],
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildProductDetails(double screenWidth, Map<String, dynamic> product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product["name"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.040,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
