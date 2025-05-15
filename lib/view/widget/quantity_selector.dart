import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onIncrease;
  final ValueChanged<int> onDecrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Decrease button
        Container(
          height: responsiveHeight(context, 40),
          width: responsiveWidth(context, 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xff009944),
              width: 1,
            ),

          ),
          child: IconButton(
            icon: Icon(
              Icons.remove,
              color: const Color(0xff009944),
              size: responsiveWidth(context, 22),
            ),
            onPressed: quantity > 1
                ? () => onDecrease(quantity - 1)
                : null, // تعطيل الزر لو العدد صفر
          ),
        ),
        SizedBox(width: 20), // Spacer between buttons and quantity text

        // Quantity text
        Text(
          '$quantity',
          style: TextStyle(
            fontSize: responsiveWidth(context, 22),
            fontWeight: FontWeight.bold, // Make the quantity text bold
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),

        SizedBox(
            width: responsiveWidth(context, 20)), // Spacer between buttons and quantity text

        // Increase button
        Container(
          height: responsiveHeight(context, 40),
          width: responsiveWidth(context, 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff009944),

          ),
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              size: responsiveWidth(context, 22),
            ),
            onPressed: () => onIncrease(quantity + 1),
          ),
        ),
      ],
    );
  }
}
