import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/cubit/cubit/onbording_cubit.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to our store',
      'description': 'Get your groceries in as fast as one hour',
      'image': 'assets/image/salesperson.png',
    },
    {
      'title': 'Enable your location',
      'description': 'We need your location to show nearby stores',
      'image': 'assets/image/location.png', // replace with your location image
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                onboardingData[0]['image']!,
                fit: BoxFit.cover,
              ),
            ),

            // Dark overlay
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),

            SafeArea(
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, pageIndex) {
                  return Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: onboardingData.length,
                          onPageChanged: (index) {
                            context.read<OnboardingCubit>().changePage(index);
                          },
                          itemBuilder: (context, index) {
                            final item = onboardingData[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsiveWidth(context, 30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    kLogoPath,
                                    height: responsiveHeight(context, 60),
                                  ),
                                  SizedBox(height: responsiveHeight(context, 30)),
                                  Text(
                                    item['title']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: responsiveWidth(context, 28),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: responsiveHeight(context, 10)),
                                  Text(
                                    item['description']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: responsiveWidth(context, 16),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: responsiveHeight(context, 60)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // "Get Started" or "Next" Button
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 30),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: responsiveHeight(context, 60),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (pageIndex < onboardingData.length - 1) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => _buildLocationPermissionPage(context),
                                  ),
                                );
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: KbuttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              pageIndex == onboardingData.length - 1
                                  ? 'Enable Location'
                                  : 'Next',
                              style: TextStyle(
                                fontSize: responsiveWidth(context, 18),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: responsiveHeight(context, 30)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLocationPermissionPage(BuildContext context) {
  return Scaffold(

    body: Stack(

      children: [


        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /*Image.asset(
                'assets/images/TakeAway2.png',
                width: 328,
                height: 328,
              ),*/
              SizedBox(height: 20),
              Text(
                'Enable Location',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Color(0xFF455A64)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 335,
                child: Text(
                  'To provide better service, we need access to your location. Please enable location services.',
                  style: TextStyle(fontSize: 16, color: Color(0xFF455A64)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),

              ElevatedButton(
                onPressed: () async {
                  await _enableLocation();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:KbuttonColor,
                  foregroundColor: Colors.white,
                  minimumSize: Size(307, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Enable Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(height: 20),

              // زر إلغاء (Cancel)
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  minimumSize: Size(307, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

}

Future<void> _enableLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("تم تحديد الموقع: ${position.latitude}, ${position.longitude}");
  } else {
    print("تم رفض الإذن!");
  }
}


