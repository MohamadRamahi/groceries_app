import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/bakery_widget.dart';

class BakeryScreen extends StatelessWidget {
  const BakeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children:  [
                Text('Bakery',style: TextStyle(fontSize:
                responsiveWidth(context, 20)),),
                BakeryWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
