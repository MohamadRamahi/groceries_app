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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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
      ),
    );
  }
}
