import 'package:flutter/material.dart';
import 'package:groceries_app/view/widget/navigationbar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationbarWidget(); // ✅ This handles both nav bar and screens
  }
}
