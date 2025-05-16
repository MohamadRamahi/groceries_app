import 'package:flutter/material.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/responsive.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar with border
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffF3F3F5),
              width: 2,
            ),
          ),
          child: const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZFs01SPDw0Brlpl7_bbZadld5oZ6kVmgFWvpQI4xg3m98yz4c',
            ),
          ),
        ),
        const SizedBox(width: 16), // Spacing between avatar and text
        // Name and Email
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'Mohamad Ramahi',
              style: TextStyle(
                fontSize: responsiveWidth(context, 18),
                color:kTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 4)),
            Text(
              'Mohamad@example.com',
              style: TextStyle(
                fontSize: responsiveWidth(context, 14),
                color: Color(0xff7C7C7C),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
