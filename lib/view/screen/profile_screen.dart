import 'package:flutter/material.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/avatar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 24),
              vertical: responsiveHeight(context, 24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarWidget(),
                SizedBox(height: responsiveHeight(context, 30)),
                 Divider(color:kDivider),
                buildMenuItem(icon: Icons.shopping_bag_outlined, text: 'Orders'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.person_outline, text: 'My Details'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.location_on_outlined, text: 'Delivery Address'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.credit_card_outlined, text: 'Payment Methods'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.card_giftcard_outlined, text: 'Promo Code'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.notifications_none, text: 'Notifications'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.help_outline, text: 'Help'),
                Divider(color:kDivider),
                buildMenuItem(icon: Icons.info_outline, text: 'About'),
                SizedBox(height: responsiveHeight(context, 30),),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size(double.infinity, responsiveHeight(context, 67)),
                    backgroundColor: Color(0xffF2F3F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: ListTile(
                   leading: Icon(Icons.logout,
                     color: Color(0xff53B175),
                   ),
                    title:  Center(
                      child: Text('Log Out',
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 18),
                      color: Color(0xff53B175),
                      fontWeight: FontWeight.bold,
                                        ),
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
