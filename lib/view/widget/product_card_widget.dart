import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final VoidCallback onTap;

  const ProductCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double cardHeight = responsiveHeight(context, 200);
    final double imageHeight = responsiveHeight(context, 120);

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  height: responsiveHeight(context, 20),
                  width: responsiveWidth(context, 80),
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
      ),
    );
  }
}
