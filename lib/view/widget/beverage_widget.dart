import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/all_product_cubit.dart';
import 'package:groceries_app/cubit/cubit/all_product_state.dart';
import 'package:groceries_app/cubit/cubit/cart_cubit.dart';
import 'package:groceries_app/model/product_model.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/product_details_screen.dart';

class BeverageWidget extends StatefulWidget {
  const BeverageWidget({Key? key}) : super(key: key);

  @override
  State<BeverageWidget> createState() => _BeverageState();
}

class _BeverageState extends State<BeverageWidget> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    // تحميل منتجات المخبوزات مرة واحدة فقط
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AllProductsCubit>().loadProductsByCategory("beverage");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24),
          vertical: responsiveHeight(context, 8)),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (query) {
              context.read<AllProductsCubit>().search(query);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: responsiveHeight(context, 12),
              ),
              hintText: 'Search beverage and drink products...',
              hintStyle: TextStyle(
                color:Color(0xff7C7C7C),
                fontSize: responsiveWidth(context, 14),
              ),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  context.read<AllProductsCubit>().loadProductsByCategory("beverage");
                },
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),

              ),
            ),
          ),
          SizedBox(
            height: responsiveHeight(context, 16),
          ),
          BlocBuilder<AllProductsCubit, AllProductsState>(
            builder: (context, state) {
              if (state is AllProductsLoaded) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
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
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  // ⬇️ باقي الكود كما هو (بناء الكارد وزر الإضافة)
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
                  color: const Color(0xff3B3B3B),
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
