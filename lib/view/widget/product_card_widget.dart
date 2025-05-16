import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final Color color;

  const ProductCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double cardHeight = responsiveHeight(context, 200); // 👈 ارتفاع البطاقة
    final double imageHeight = responsiveHeight(context, 120); // 👈 ارتفاع الصورة داخل البطاقة

    return Container(
      height: cardHeight,
      padding: EdgeInsets.all(responsiveWidth(context, 20)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            height: imageHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 10)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: responsiveWidth(context, 16),
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
