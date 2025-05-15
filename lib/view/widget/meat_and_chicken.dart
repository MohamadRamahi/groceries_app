

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/best_selling_cubit.dart';
import 'package:groceries_app/cubit/cubit/cart_cubit.dart';
import 'package:groceries_app/cubit/cubit/meat_and_chiken_cubit.dart';
import 'package:groceries_app/cubit/cubit/top_rated_cubit.dart';
import 'package:groceries_app/view/screen/product_details_screen.dart';

import '../../../model/product_model.dart';

class MeatAndChicken extends StatelessWidget {
  const MeatAndChicken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MeatAndChikenCubit(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<MeatAndChikenCubit, MeatAndChikenState>(
          builder: (context, state) {
            if (state is MeatAndChikenLoaded) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return _buildProductCard(screenWidth, product,  context);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
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
          description1: product["description1"]??'',

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
      child: SizedBox(
        width: 170,
        child: Card(
          color:  const Color(0xffFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color:  const Color(0xffDBF4D1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 10),

              ),
              const SizedBox(height: 6),
              _buildProductImage(product),
              _buildProductDetails(screenWidth, product,  context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(Map<String, dynamic> product) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: Image.asset(product["image"], fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildProductDetails(double screenWidth, Map<String, dynamic> product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product["name"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.040,
              color:  Colors.black,
            ),
          ),
          Text(
            product["description"],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: screenWidth * 0.030,
              color:  const Color(0xff3B3B3B),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product["price"]}",
                style: TextStyle(
                  color: const Color(0xff25AE4B),
                  fontSize: screenWidth * 0.035,
                ),
              ),
              _buildAddButton(screenWidth, context, product), // Pass the product
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(double screenWidth, BuildContext context, Map<String, dynamic> product) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff25AE4B),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            // Use the data from the product to add to the cart
            final productModel = Product(
              name: product["name"],
              price: product["price"],
              image: product["image"],
              images: product['images'] ?? '',
              description: product["description"],
              description1: product["description1"]??'',
            );

            // Ensure CartCubit is available in the context
            context.read<CartCubit>().addToCart(
              product: productModel,
              quantity: 1,      // Default quantity
            );
          },
          icon: Icon(Icons.add, size: screenWidth * 0.035, color: Colors.white),
        ),
      ),
    );
  }
}

