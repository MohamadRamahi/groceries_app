import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController passwordEditingController;

  const PasswordWidget({
    super.key,
    required this.passwordEditingController,
  });

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
          BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          spreadRadius: 1,
          offset: const Offset(0, 2),
          )
          ],
        ),
        child: TextField(
          controller: widget.passwordEditingController,
          obscureText: obscureText,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.04,
          ),
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[700],
            ),
            hintText: "Enter your password",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[600],
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.045,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xffEDF1F3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xff25AE4B),
                width: 2,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => obscureText = !obscureText);
              },
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}