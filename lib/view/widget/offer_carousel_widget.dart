import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferCarouselWidget extends StatefulWidget {
  @override
  State<OfferCarouselWidget> createState() => _OfferCarouselWidgetState();
}

class _OfferCarouselWidgetState extends State<OfferCarouselWidget> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> offers = [
    {
      "image": "assets/image/fresh_vegetables.png",
      "title": "Fresh Vegetables",
      "subtitle": "Get Up To 40% OFF",
    },
    {
      "image": "assets/image/fresh_fruits.png",
      "title": "Fresh Fruits",
      "subtitle": "Flat 30% Discount",
    },
    {
      "image": "assets/image/beverage2.png",
      "title": "Delicious beverage",
      "subtitle": "Buy 2 Get 1 Free",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: responsiveHeight(context, 160),
          child: PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return OfferWidget(
                imagePath: offer["image"]!,
                title: offer["title"]!,
                subtitle: offer["subtitle"]!,
              );
            },
          ),
        ),
        SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _pageController,
          count: offers.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.green,
            dotColor: Colors.grey.shade300,
            dotHeight: screenWidth * 0.015,
            dotWidth: screenWidth * 0.025,
            spacing: screenWidth * 0.01,
            radius: 12,
          ),
        ),
      ],
    );
  }
}

class OfferWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OfferWidget({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
        border: Border.all( // Add border here
          color: Colors.black12, // Specify border color
          width: 2, // Border thickness
        ),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.grey.shade300,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.only(left: 10.0,top: 10,bottom: 10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      color: Color(0xFF2BAE4A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
