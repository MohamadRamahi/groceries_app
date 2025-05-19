import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/cubit/cubit/cart_cubit.dart';
import 'package:groceries_app/cubit/cubit/favorite_cubit.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/home_screen.dart';
import 'package:groceries_app/view/widget/favorite_widget.dart';
import 'package:groceries_app/view/widget/navigationbar_widget.dart';
import 'package:groceries_app/view/widget/nutritions_widget.dart';
import 'package:groceries_app/view/widget/product_detail_section.dart';
import 'package:groceries_app/view/widget/quantity_selector.dart';
import '../../../model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;


  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  late Product currentProduct;

  @override
  void initState() {
    super.initState();
    currentProduct = widget.product;
  }

  void onFavoriteToggle() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;

      if (widget.product.isFavorite) {
        context.read<FavoriteProductsCubit>().addToFavorites(widget.product);
      } else {
        context.read<FavoriteProductsCubit>().removeFromFavorites(widget.product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F3F2),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffF2F3F2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Image.asset(
                currentProduct.image,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        currentProduct.name,
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FavoriteWidget(
                      item: widget.product,
                      onFavoriteToggle: onFavoriteToggle,
                    ),


                  ],
                ),
                SizedBox(height: responsiveHeight(context, 10)),
                Text(
                  currentProduct.description,
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 18),
                    color: const Color(0xff7C7C7C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantitySelector(
                      quantity: quantity,
                      onIncrease: (newQuantity) {
                        setState(() {
                          quantity = newQuantity;
                        });
                      },
                      onDecrease: (newQuantity) {
                        setState(() {
                          quantity = newQuantity;
                        });
                      },
                    ),
                    Text(
                      "\$${currentProduct.price}",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 20),
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 30),),
                Divider(),
                ProductDetailSection(description1: currentProduct.description, ),
                Divider(),
                SizedBox(height: responsiveHeight(context, 16),),
                NutritionSection(),
                SizedBox(
                  height: responsiveHeight(context, 30),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(
                      product: currentProduct,
                      quantity: quantity,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Successfully added ${currentProduct.name} to basket",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                        ),),
                        duration: Duration(seconds: 2),
                        backgroundColor:KbuttonColor,

                      ),

                    );

                    Navigator.pop(context); // لإغلاق صفحة التفاصيل
                    NavigationbarWidget.controller.index = 0; // الرجوع إلى تبويب Home

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KbuttonColor, // Use your defined green color
                    minimumSize: const Size(double.infinity, 64), // Full width, fixed height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32), // More rounded for pill shape
                    ),
                    elevation: 0, // Flat style
                  ),
                  child: const Text(
                    'Add To Basket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )



              ],
            ),
          ),
        ],
      ),
    );
  }
}
