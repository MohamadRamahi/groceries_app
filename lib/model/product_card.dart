// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/model/product.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product item;
//   final VoidCallback onFavoriteToggle;
//   final VoidCallback onOrderNow;
//
//   const ProductCard({
//     super.key,
//     required this.item,
//     required this.onFavoriteToggle,
//     required this.onOrderNow,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isSmallScreen = screenWidth < 400;
//
//     return SizedBox(
//       //   height: isSmallScreen ? 240 : 270,
//       height: 252,
//       width:177,
//
//       child: Stack(
//
//         clipBehavior: Clip.none,
//         children: [
//           // الكارد الأساسي (يبدأ بعد الصورة)
//           Positioned(
//             top: isSmallScreen ? 30 : 40,
//             left: 5,
//             right: 5,
//             child: Card(
//             color: Colors.transparent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 side: BorderSide(color: Color(0xFFDBF4D1), width: 2),
//               ),
//               elevation: 0,
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       item.name.tr() ?? "No Name",
//                       style: TextStyle(
//                         fontSize: isSmallScreen ? 14 : 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 6),
//                     Text(
//                       item.description.tr() ?? "No Description",
//                       style: TextStyle(
//                         fontSize: isSmallScreen ? 10 : 12,
//                         color: Colors.grey[700],
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 6),
//                     Text(
//                       "\$${(item.price ?? 0).toStringAsFixed(2)}",
//                       style: TextStyle(
//                         fontSize: isSmallScreen ? 16 : 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 20,)
//                   ],
//
//                 ),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: CircleAvatar(
//                 radius: isSmallScreen ? 30 : 40,
//                 backgroundColor: Colors.white,
//                 backgroundImage: item.image != null
//                     ? AssetImage(item.image!)
//                     : const AssetImage('assets/images/default.png'),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 20,
//             right: 0, // على الحافة اليمنى
//             child: IconButton(
//               style: ButtonStyle(
//                 backgroundColor: WidgetStatePropertyAll<Color>(
//                     Color(0xFFDBF4D1)
//
//
//                 ),
//                 shape:WidgetStatePropertyAll<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15)
//               ),
//                 )),
//               icon: Icon(
//                 item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: Colors.green,
//                 size: isSmallScreen ? 20 : 24,
//
//               ),
//               onPressed: onFavoriteToggle,
//
//             ),
//           ),
//
//           // زر الطلب
//           // Positioned(
//           //
//           //   left: 0,
//           //   right: 0,
//           //   bottom: 0,
//           //   child: Padding(
//           //     padding: const EdgeInsets.symmetric(horizontal: 15),
//           //     child: SizedBox(
//           //       width: 105,
//           //       height: 27,
//           //       child: ElevatedButton(
//           //         onPressed: onOrderNow,
//           //         style: ElevatedButton.styleFrom(
//           //           backgroundColor: Colors.green,
//           //           foregroundColor: Colors.white,
//           //           shape: const StadiumBorder(),
//           //           padding: EdgeInsets.symmetric(
//           //             vertical: isSmallScreen ? 8 : 12,
//           //           ),
//           //         ),
//           //
//           //         child: Text(
//           //           "Order Now".tr(),
//           //           style: TextStyle(
//           //             fontSize: isSmallScreen ? 12 : 14,
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           //),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 35, // مسافة بسيطة من الأسفل
//             child: Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 95,
//                 height: 27,
//                 child: ElevatedButton(
//                   onPressed: onOrderNow,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25), // مطابق للـ Radius
//                     ),
//                     padding: EdgeInsets.zero, // نلغي الـ padding
//                   ),
//                   child: Text(
//                     "Order Now".tr(),
//                     style: TextStyle(
//                       fontSize:isSmallScreen ? 12 : 14
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/model/product.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product item;
//   final VoidCallback onFavoriteToggle;
//   final VoidCallback onOrderNow;
//
//   const ProductCard({
//     super.key,
//     required this.item,
//     required this.onFavoriteToggle,
//     required this.onOrderNow,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isSmallScreen = screenWidth < 400;
//
//     return SizedBox(
//       height: 252,
//       width: 177,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // الكارد الأساسي (يبدأ بعد الصورة)
//           Positioned(
//             top: isSmallScreen ? 30 : 40,
//             left: 5,
//             right: 5,
//             child: Card(
//               color: Colors.transparent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 side: BorderSide(color: Color(0xFFDBF4D1), width: 2),
//               ),
//               elevation: 0,
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // الاسم والوصف
//                     Column(
//                       children: [
//                         Text(
//                           item.name.tr() ?? "No Name",
//                           style: TextStyle(
//                             fontSize: isSmallScreen ? 14 : 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 10), // تباعد أكبر بين الاسم والوصف
//                         Text(
//                           item.description.tr() ?? "No Description",
//                           style: TextStyle(
//                             fontSize: isSmallScreen ? 10 : 12,
//                             color: Colors.grey[700],
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
// SizedBox(height: 20,),
//                     // السعر
//                     Text(
//                       "\$${(item.price ?? 0).toStringAsFixed(2)}",
//                       style: TextStyle(
//                         fontSize: isSmallScreen ? 16 : 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           // صورة المنتج
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: CircleAvatar(
//                 radius: isSmallScreen ? 30 : 40,
//                 backgroundColor: Colors.white,
//                 backgroundImage: item.image != null
//                     ? AssetImage(item.image!)
//                     : const AssetImage('assets/images/default.png'),
//               ),
//             ),
//           ),
//
//           // زر المفضلة
//           Positioned(
//             top: 20,
//             right: 0,
//             child: IconButton(
//               style: ButtonStyle(
//                 backgroundColor: WidgetStatePropertyAll<Color>(
//                   Color(0xFFDBF4D1),
//                 ),
//                 shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               icon: Icon(
//                 item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: Colors.green,
//                 size: isSmallScreen ? 20 : 24,
//               ),
//               onPressed: onFavoriteToggle,
//             ),
//           ),
//
//           // زر الطلب
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 35,
//             child: Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 95,
//                 height: 27,
//                 child: ElevatedButton(
//                   onPressed: onOrderNow,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     padding: EdgeInsets.zero,
//                   ),
//                   child: Text(
//                     "Order Now".tr(),
//                     style: TextStyle(
//                       fontSize: isSmallScreen ? 12 : 14,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/model/product.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product item;
//   final VoidCallback onFavoriteToggle;
//   final VoidCallback onOrderNow;
//
//   const ProductCard({
//     super.key,
//     required this.item,
//     required this.onFavoriteToggle,
//     required this.onOrderNow,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     // استخدم ResponsiveBreakpoints لتحديد إذا كانت الشاشة صغيرة أو كبيرة
//     final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(MOBILE);
//
//     // استخدم ResponsiveValue لتحديد حجم النصوص بناءً على حجم الشاشة
//     final double titleFontSize = ResponsiveValue(
//       context,
//       defaultValue: 16.0,
//       conditionalValues: [
//         Condition.smallerThan(name: MOBILE, value: 14.0),
//       ],
//     ).value!;
//
//     final double descriptionFontSize = ResponsiveValue(
//       context,
//       defaultValue: 12.0,
//       conditionalValues: [
//         Condition.smallerThan(name: MOBILE, value: 10.0),
//       ],
//     ).value!;
//
//     final double priceFontSize = ResponsiveValue(
//       context,
//       defaultValue: 18.0,
//       conditionalValues: [
//         Condition.smallerThan(name: MOBILE, value: 16.0),
//       ],
//     ).value!;
//
//     final double circleAvatarRadius = ResponsiveValue(
//       context,
//       defaultValue: 40.0,
//       conditionalValues: [
//         Condition.smallerThan(name: MOBILE, value: 30.0),
//       ],
//     ).value!;
//
//     final double orderButtonFontSize = ResponsiveValue(
//       context,
//       defaultValue: 14.0,
//       conditionalValues: [
//         Condition.smallerThan(name: MOBILE, value: 12.0),
//       ],
//     ).value!;
//
//     return SizedBox(
//       height: 252,
//       width: 177,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: isSmallScreen ? 30 : 40,
//             left: 5,
//             right: 5,
//             child: Card(
//               color: theme.cardColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 side: const BorderSide(
//                   color: Color(0xFFDBF4D1),
//                   width: 1,
//                 ),
//               ),
//               elevation: 0,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//
//                       children: [
//                         Text(
//                           item.name.tr() ?? "No Name",
//                           style: TextStyle(
//                             fontSize: titleFontSize,
//                             fontWeight: FontWeight.bold,
//                             color: theme.textTheme.bodyLarge?.color,
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           item.description.tr() ?? "No Description",
//                           style: TextStyle(
//                             fontSize: descriptionFontSize,
//                             color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       "\$${(item.price ?? 0).toStringAsFixed(2)}",
//                       style: TextStyle(
//                         fontSize: priceFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: theme.textTheme.bodyLarge?.color,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: CircleAvatar(
//                 radius: circleAvatarRadius,
//                 backgroundColor: Colors.white,
//                 backgroundImage: item.image != null
//                     ? AssetImage(item.image!)
//                     : const AssetImage('assets/images/default.png'),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 20,
//             right: 0,
//             child: IconButton(
//               style: ButtonStyle(
//                 backgroundColor: const WidgetStatePropertyAll<Color>(
//                   Color(0xFFDBF4D1),
//                 ),
//                 shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               icon: Icon(
//                 item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: Colors.green,
//                 size: isSmallScreen ? 20 : 24,
//               ),
//               onPressed: onFavoriteToggle,
//             ),
//           ),
//
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: isSmallScreen ? 40 : 0,
//             child: Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 95,
//                 height: 27,
//                 child: ElevatedButton(
//                   onPressed: onOrderNow,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     padding: EdgeInsets.zero,
//                   ),
//                   child: Text(
//                     "Order Now".tr(),
//                     style: TextStyle(
//                       fontSize: orderButtonFontSize,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/model/product.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product item;
//   final VoidCallback onFavoriteToggle;
//   final VoidCallback onOrderNow;
//
//   const ProductCard({
//     super.key,
//     required this.item,
//     required this.onFavoriteToggle,
//     required this.onOrderNow,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     // استخدم MediaQuery للحصول على عرض الشاشة
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isSmallScreen = screenWidth < 600; // شاشة صغيرة إذا كانت العرض أقل من 600
//
//     // تحديد أحجام النصوص بناءً على عرض الشاشة
//     final double titleFontSize = isSmallScreen ? 14.0 : 18.0;
//     final double descriptionFontSize = isSmallScreen ? 10.0 : 14.0;
//     final double priceFontSize = isSmallScreen ? 16.0 : 20.0;
//     final double circleAvatarRadius = isSmallScreen ? 30.0 : 50.0;
//     final double orderButtonFontSize = isSmallScreen ? 12.0 : 16.0;
//
//     return SizedBox(
//       height: isSmallScreen ? 250 : 320, // تغييرات في الارتفاع بناءً على حجم الشاشة
//       width: isSmallScreen ? 180 : 250, // تغييرات في العرض بناءً على حجم الشاشة
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: isSmallScreen ? 30 : 40,
//             left: 5,
//             right: 5,
//             child: Card(
//               color: theme.cardColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 side: const BorderSide(
//                   color: Color(0xFFDBF4D1),
//                   width: 1,
//                 ),
//               ),
//               elevation: 0,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           item.name.tr() ?? "No Name",
//                           style: TextStyle(
//                             fontSize: titleFontSize,
//                             fontWeight: FontWeight.bold,
//                             color: theme.textTheme.bodyLarge?.color,
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           item.description.tr() ?? "No Description",
//                           style: TextStyle(
//                             fontSize: descriptionFontSize,
//                             color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       "\$${(item.price ?? 0).toStringAsFixed(2)}",
//                       style: TextStyle(
//                         fontSize: priceFontSize,
//                         fontWeight: FontWeight.bold,
//                         color: theme.textTheme.bodyLarge?.color,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: CircleAvatar(
//                 radius: circleAvatarRadius,
//                 backgroundColor: Colors.white,
//                 backgroundImage: item.image != null
//                     ? AssetImage(item.image!)
//                     : const AssetImage('assets/images/default.png'),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 20,
//             right: 0,
//             child: IconButton(
//               style: ButtonStyle(
//                 backgroundColor: const WidgetStatePropertyAll<Color>(
//                   Color(0xFFDBF4D1),
//                 ),
//                 shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               icon: Icon(
//                 item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: Colors.green,
//                 size: isSmallScreen ? 20 : 24,
//               ),
//               onPressed: onFavoriteToggle,
//             ),
//           ),
//
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: isSmallScreen ? 40 : 0,
//             child: Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 95,
//                 height: 27,
//                 child: ElevatedButton(
//                   onPressed: onOrderNow,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     padding: EdgeInsets.zero,
//                   ),
//                   child: Text(
//                     "Order Now".tr(),
//                     style: TextStyle(
//                       fontSize: orderButtonFontSize,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*import 'package:flutter/material.dart';
import 'package:groceries_app/model/product_model.dart';

// دالة مساعدة لجعل العرض يستجيب لعرض الشاشة
double responsiveWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * (percentage / 100);
}

class ProductCard extends StatelessWidget {
  final Product item;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onOrderNow;

  const ProductCard({
    super.key,
    required this.item,
    required this.onFavoriteToggle,
    required this.onOrderNow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 720;

    return SizedBox(
      height: isSmallScreen ? 250 : responsiveWidth(context, 40), // ارتفاع يستجيب
      width: isSmallScreen ? 180 : responsiveWidth(context, 30), // عرض يستجيب
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: isSmallScreen ? 30 : responsiveWidth(context, 6), // أعلى يستجيب
            left: responsiveWidth(context, 1),
            right: responsiveWidth(context, 1),
            child: Card(
              color: theme.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsiveWidth(context, 5)), // حواف تستجيب
                side: const BorderSide(
                  color: Color(0xFFDBF4D1),
                  width: 1,
                ),
              ),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  responsiveWidth(context, 4),
                  responsiveWidth(context, 12),
                  responsiveWidth(context, 4),
                  responsiveWidth(context, 10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          item.name ?? "No Name",
                          style: TextStyle(
                            fontSize: responsiveWidth(context, isSmallScreen ? 3.5 : 4.5), // حجم الخط يستجيب
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: responsiveWidth(context, 2)),
                        Text(
                          item.description ?? "No Description",
                          style: TextStyle(
                            fontSize: responsiveWidth(context, isSmallScreen ? 2.5 : 3.5), // حجم الخط يستجيب
                            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveWidth(context, 5)),
                    Text(
                      "\$${(item.price ?? 0).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, isSmallScreen ? 4 : 5), // حجم الخط يستجيب
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: responsiveWidth(context, isSmallScreen ? 8 : 12), // نصف القطر يستجيب
                backgroundColor: Colors.white,
                backgroundImage: item.image != null
                    ? AssetImage(item.image!)
                    : const AssetImage('assets/images/default.png'),
              ),
            ),
          ),
          Positioned(
            top: responsiveWidth(context, 5),
            right: responsiveWidth(context, 0),
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll<Color>(
                  Color(0xFFDBF4D1),
                ),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(responsiveWidth(context, 3)), // حواف تستجيب
                  ),
                ),
              ),
              icon: Icon(
                item.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.green,
                size: responsiveWidth(context, isSmallScreen ? 5 : 6), // الحجم يستجيب
              ),
              onPressed: onFavoriteToggle,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: isSmallScreen ? responsiveWidth(context, 10) : responsiveWidth(context, 5),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: responsiveWidth(context, 25),
                height: responsiveWidth(context, 7),
                child: ElevatedButton(
                  onPressed: onOrderNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(responsiveWidth(context, 7)), // حواف تستجيب
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    "Order Now",
                    style: TextStyle(
                      fontSize: responsiveWidth(context, isSmallScreen ? 3 : 4), // حجم الخط يستجيب
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/