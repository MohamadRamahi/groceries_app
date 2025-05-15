import 'package:flutter/material.dart';
import 'dart:async';

import 'package:groceries_app/const.dart';
import 'package:groceries_app/responsive.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();

    // Delay navigation safely after first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/intro');
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              kLogoPath, // or 'assets/logo.png'
              width: responsiveWidth(context, 60),
              height: responsiveWidth(context, 60),
              color: Colors.white,
            ),
            SizedBox(width: responsiveWidth(context, 12)),
            Text(
              "Nectar",
              style: TextStyle(
                fontSize: responsiveWidth(context, 42),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
