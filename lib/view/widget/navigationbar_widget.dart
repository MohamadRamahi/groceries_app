import 'package:flutter/material.dart';
import 'package:groceries_app/view/screen/cart_screen.dart';
import 'package:groceries_app/view/screen/explorer_screen.dart';
import 'package:groceries_app/view/screen/favorite_screen.dart';
import 'package:groceries_app/view/screen/profile_screen.dart';
import 'package:groceries_app/view/screen/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigationbarWidget extends StatefulWidget {
  @override
  _NavigationbarWidgetState createState() => _NavigationbarWidgetState();
}

class _NavigationbarWidgetState extends State<NavigationbarWidget> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      ExplorerScreen(),
      CartScreen(),
      FavoritesScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.store),
        title: ("Shop"),
        activeColorPrimary: Color(0xff53B175),
        inactiveColorPrimary: Color(0xff181725),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.manage_search_sharp),
        title: ("Explore"),
        activeColorPrimary: Color(0xff53B175),
        inactiveColorPrimary: Color(0xff181725),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Color(0xff53B175),
        inactiveColorPrimary: Color(0xff181725),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border),
        title: ("Favorite"),
        activeColorPrimary: Color(0xff53B175),
        inactiveColorPrimary: Color(0xff181725),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Account"),
        activeColorPrimary: Color(0xff53B175),
        inactiveColorPrimary: Color(0xff181725),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style6, // Try different styles here
    );
  }
}
