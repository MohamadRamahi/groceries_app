

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController phoneEditingController;
  final String? Function(String?)? validator;

  const PhoneWidget({
    Key? key,
    required this.phoneEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color:  Colors.black12, // Shadow color
              blurRadius: 4, // Soft shadow
              spreadRadius: 1, // Shadow spread
              offset: const Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: IntlPhoneField(
          controller: phoneEditingController,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
            ),
            hintText: "79/77/78",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
            ),
            filled: true, // Ensure the background is filled
            fillColor: Colors.white, // Matches container color
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.045,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // No border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0xffEDF1F3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color:  const Color(0xff25AE4B),
                width: 2,
              ),
            ),
          ),
          initialCountryCode: 'JO', // Default country code (Jordan)
          onChanged: (phone) {
            print(phone.completeNumber); // Get the complete phone number
          },
          disableLengthCheck: true, // Disable length validation (optional)
        ),
      ),
    );
  }
}
