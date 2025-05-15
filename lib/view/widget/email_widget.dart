import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  EmailWidget({
    super.key,
    required this.emailEditingController,
  });
  bool showErrorName = false;
  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Soft shadow color
              blurRadius: 2, // How soft the shadow is
              spreadRadius: 0, // How much the shadow spreads
              offset: Offset(0, 1), // Moves shadow down (x: 0, y: 4)
            ),
          ],
        ),
        child: TextField(
          controller: emailEditingController,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03,
          ),
          decoration: InputDecoration(
            labelText: 'Email',labelStyle: TextStyle(
            fontSize: screenWidth * 0.025,

          ),
            hintText: "Enter your email",
            hintStyle:TextStyle(
              fontSize: screenWidth * 0.025,

            ),
            fillColor: Colors.white, // ✅ Matches container color
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // ✅ No border (shadow does the job)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
