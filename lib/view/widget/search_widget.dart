import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/responsive.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 16),
        vertical: responsiveHeight(context, 4),
      ),
      decoration: BoxDecoration(
        color:Color(0xffF2F3F2),
        borderRadius: BorderRadius.circular(responsiveWidth(context, 15)),
        border: Border.all(
          color:Colors.white,
          width: 1,
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: responsiveWidth(context, 14),
          color:Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: responsiveHeight(context, 12),
          ),
          hintText: "Search Store",
          hintStyle: TextStyle(
            color:Color(0xff7C7C7C),
            fontSize: responsiveWidth(context, 14),
          ),
          prefixIcon: Icon(
            Icons.search,
            color:Color(0xff181B19),
            size: responsiveWidth(context, 24),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
