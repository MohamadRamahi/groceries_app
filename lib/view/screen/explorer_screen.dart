import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:groceries_app/const.dart';
import 'package:groceries_app/cubit/cubit/explore_cubit.dart';
import 'package:groceries_app/cubit/cubit/explore_state.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/bakery_scree.dart';
import 'package:groceries_app/view/screen/beverage_screen.dart';
import 'package:groceries_app/view/screen/cooking_oil_screen.dart';
import 'package:groceries_app/view/screen/diary_screen.dart';
import 'package:groceries_app/view/screen/fresh_frutes_screen.dart';
import 'package:groceries_app/view/screen/meat_fish_screen.dart';
import 'package:groceries_app/view/widget/product_card_widget.dart';
import 'package:groceries_app/view/widget/search_widget.dart';

class ExplorerScreen extends StatelessWidget {
  const ExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExplorerCubit()..loadProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsiveHeight(context, 8)),
                _buildTitle(context),
                SizedBox(height: responsiveHeight(context, 30)),
                 SearchWidget(),
                SizedBox(height: responsiveHeight(context, 20)),
                Expanded(
                  child: BlocBuilder<ExplorerCubit, ExplorerState>(
                    builder: (context, state) {
                      if (state is ExplorerLoaded) {
                        final colors = [
                           Color(0xff53B175).withOpacity(0.25),
                           Color(0xffF8A44C).withOpacity(0.25),
                           Color(0xffF7A593).withOpacity(0.25),
                           Color(0xffD3B0E0).withOpacity(0.25),
                           Color(0xffFDE598).withOpacity(0.25),
                           Color(0xffB7DFF5).withOpacity(0.25),
                        ];
                        return GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3 / 4,
                          ),
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            final color = colors[index % colors.length];

                            return ProductCardWidget(
                              title: product.name1,
                              image: product.image1,
                              color: color,
                              onTap: () {
                                switch (product.name1.trim()) {
                                  case 'Fresh Fruits \n & Vegetables':
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => FreshFruitsScreen()));
                                    break;
                                  case 'Cooking Oil \n & Ghee':
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => CookingOilScreen()));
                                    break;
                                  case 'Meat & Fish':
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => MeatFishScreen()));
                                    break;
                                  case 'Bakery & Snacks':
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => BakeryScreen()));
                                    break;
                                  case 'Diary & Eggs':
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => DiaryEggsScreen()));
                                    break;
                                  case 'Beverage':
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => BeverageScreen()));
                                    break;
                                }
                              },
                            );
                          },

                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        'Find Product',
        style: TextStyle(
          fontSize: responsiveWidth(context, 20),
          color: kTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
