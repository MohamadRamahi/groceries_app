import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/fresh_frutis_widget.dart';
import 'package:groceries_app/view/widget/meat_and_fish_widget.dart';

class MeatFishScreen extends StatelessWidget {
  const MeatFishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children:  [
              Text('Meat and Fish',style: TextStyle(
                  fontSize: responsiveWidth(context, 20),
                  fontWeight: FontWeight.w600
              ),
              ),
              MeatAndFishWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
