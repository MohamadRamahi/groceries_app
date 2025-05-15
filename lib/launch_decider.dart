/*import 'package:flutter/material.dart';
import 'package:groceries_app/view/screen/intro_screen.dart';
import 'package:groceries_app/view/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchDecider extends StatefulWidget {
  @override
  _LaunchDeciderState createState() => _LaunchDeciderState();
}

class _LaunchDeciderState extends State<LaunchDecider> {
  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }


  void checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      // Navigate to onboarding first
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    } else {
      // Already used app before — go to Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
*/