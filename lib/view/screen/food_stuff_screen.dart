import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/beverage_widget.dart';
import 'package:groceries_app/view/widget/food_stuff_widget.dart';
import 'package:groceries_app/view/widget/fresh_frutis_widget.dart';

class FoodStuffScreen extends StatelessWidget {
  const FoodStuffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children:  [
              Text('Food',style: TextStyle(
                  fontSize:responsiveWidth(context, 20),
                  fontWeight:FontWeight.w600 ),
              ),
              FoodStuffWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
