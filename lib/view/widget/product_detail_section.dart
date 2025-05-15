import 'package:flutter/material.dart';
import 'package:groceries_app/model/product_card.dart';
import 'package:groceries_app/responsive.dart';

class ProductDetailSection extends StatefulWidget {
  final String description1;

  const ProductDetailSection({
    super.key,
    required this.description1,
  });

  @override
  State<ProductDetailSection> createState() => _ProductDetailSectionState();
}

class _ProductDetailSectionState extends State<ProductDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      // Override the default divider color
      data: Theme.of(context).copyWith(
        dividerColor: Color(0xffE2E2E2)
      ),
      child: ExpansionTile(
        title: Text(
          "Product Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: responsiveWidth(context, 16),
            color: Colors.black,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_down_rounded),
        tilePadding: EdgeInsets.symmetric(horizontal: 0),
        childrenPadding: EdgeInsets.only(left: 0, right: 0, bottom: 12),
        // Remove borders
        shape: Border.all(color: Colors.transparent),
        collapsedShape: Border.all(color: Colors.transparent),
        children: [
          Text(
            widget.description1,
            style: TextStyle(
              fontSize: responsiveWidth(context, 16),
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}