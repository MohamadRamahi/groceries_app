import 'package:flutter/material.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  "assets/image/success.png",
                  height: responsiveHeight(context, 300),
                ),
              ),
              SizedBox(height: responsiveHeight(context, 30)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Your Order has been \n accepted',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 24),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: responsiveHeight(context, 24)),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: KbuttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: responsiveHeight(context, 67),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 24),
                      vertical: responsiveHeight(context, 12),
                    ),
                    child: Center(
                      child: Text(
                        'Track Order',
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 18),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: responsiveHeight(context, 12),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: responsiveHeight(context, 67),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 24),
                      vertical: responsiveHeight(context, 12),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 18),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
