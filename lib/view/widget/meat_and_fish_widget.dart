import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/beverage_cubit.dart';
import 'package:groceries_app/cubit/cubit/cart_cubit.dart';
import 'package:groceries_app/cubit/cubit/fresh_frutes_cubit.dart';
import 'package:groceries_app/cubit/cubit/meat_and_fish_cubit.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/product_details_screen.dart';

import '../../../model/product_model.dart';

class MeatAndFishWidget extends StatelessWidget {
  const MeatAndFishWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MeatAndFishCubit(),
      child: BlocBuilder<MeatAndFishCubit, MeatAndFishState>(
        builder: (context, state) {
          if (state is MeatAndFishLoaded) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // disables scroll if inside scrollable
                shrinkWrap: true,
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return _buildProductCard(screenWidth, product, context);
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildProductCard(double screenWidth, Map<String, dynamic> product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        final productModel = Product(
          name: product["name"],
          price: product["price"],
          description: product["description"],
          description1: product["description1"] ?? '',
          image: product["image"],
          images: product['images'] ?? '',
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: productModel),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffDBF4D1)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  product["image"],
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                product["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveWidth(context, 14),
                ),
              ),
              Text(
                product["description"],
                style: TextStyle(
                  fontSize: responsiveWidth(context, 10),
                  color:  Color(0xff3B3B3B),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product["price"]}",
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 14),
                      color: const Color(0xff25AE4B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildAddButton(context, screenWidth, product),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, double screenWidth, Map<String, dynamic> product) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xff25AE4B),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.add, size: screenWidth * 0.035, color: Colors.white),
        onPressed: () {
          final productModel = Product(
            name: product["name"],
            price: product["price"],
            image: product["image"],
            images: product['images'] ?? '',
            description: product["description"],
            description1: product["description1"] ?? '',
          );
          context.read<CartCubit>().addToCart(
            product: productModel,
            quantity: 1,
          );
        },
      ),
    );
  }
}
