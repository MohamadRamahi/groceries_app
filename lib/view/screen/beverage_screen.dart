import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/beverage_widget.dart';

class BeverageScreen extends StatelessWidget {
  const BeverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children:  [
              Text('Beverage',style: TextStyle(fontSize:
              responsiveWidth(context, 20)),),
              BeverageWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
