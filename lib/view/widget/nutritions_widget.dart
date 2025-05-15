import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';

class NutritionSection extends StatelessWidget {
  const NutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // "Nutritions" text
        Text(
          'Nutritions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 170),

        // "100gr" container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '100gr',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Optional icon (like a diagonal arrow or info icon)
        Icon(
          Icons.arrow_forward_ios, // Or use a custom SVG/icon if needed
          size: responsiveWidth(context, 16),
          color: Colors.black,
        ),
      ],
    );
  }
}
