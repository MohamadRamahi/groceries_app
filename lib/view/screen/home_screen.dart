import 'package:flutter/material.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/best_selling_widget.dart';
import 'package:groceries_app/view/widget/groceries_widget.dart';
import 'package:groceries_app/view/widget/location_title_widget.dart';
import 'package:groceries_app/view/widget/meat_and_chicken.dart';
import 'package:groceries_app/view/widget/offer_carousel_widget.dart';
import 'package:groceries_app/view/widget/search_widget.dart';
import 'package:groceries_app/view/widget/top_rated_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: responsiveHeight(context, 60)),

                // ✅ App logo
                Center(
                  child: Image.asset(
                    kLogoPath,
                    height: responsiveHeight(context, 60),
                    width: responsiveWidth(context, 60),
                  ),
                ),

                SizedBox(height: responsiveHeight(context, 16)),

                // ✅ Location Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Color(0xff393636)),
                    SizedBox(width: responsiveWidth(context, 8)),
                    LocationTitleWidget(),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 20)),
                SearchWidget(),

                SizedBox(height: responsiveHeight(context, 20)),

                // ✅ Offers carousel
                OfferCarouselWidget(),

                SizedBox(height: responsiveHeight(context, 30)),

                // ✅ Section header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exclusive Offer',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: responsiveWidth(context, 24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xff53B175),
                        fontSize: responsiveWidth(context, 16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: responsiveHeight(context, 10)),

                // ✅ Top-rated products widget
                TopRatedProducts(),

                SizedBox(height: responsiveHeight(context, 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Selling',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: responsiveWidth(context, 24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xff53B175),
                        fontSize: responsiveWidth(context, 16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                BestSellingWidget(),
                SizedBox(height: responsiveHeight(context, 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Groceries',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: responsiveWidth(context, 24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xff53B175),
                        fontSize: responsiveWidth(context, 16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GroceriesWidget(),
                SizedBox(height: responsiveHeight(context, 20)),
                MeatAndChicken(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
