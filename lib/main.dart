import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/cubit/best_selling_cubit.dart';
import 'package:groceries_app/cubit/cubit/beverage_cubit.dart';
import 'package:groceries_app/cubit/cubit/bottom_navbar_cubit.dart';
import 'package:groceries_app/cubit/cubit/cart_cubit.dart';
import 'package:groceries_app/cubit/cubit/food_stuff_cubit.dart';
import 'package:groceries_app/cubit/cubit/explore_cubit.dart';
import 'package:groceries_app/cubit/cubit/favorite_cubit.dart';
import 'package:groceries_app/cubit/cubit/fresh_frutes_cubit.dart';
import 'package:groceries_app/cubit/cubit/location_cubit.dart';
import 'package:groceries_app/cubit/cubit/login_cubit.dart';
import 'package:groceries_app/cubit/cubit/meat_and_chiken_cubit.dart';
import 'package:groceries_app/cubit/cubit/meat_and_fish_cubit.dart';
import 'package:groceries_app/cubit/cubit/onbording_cubit.dart';
import 'package:groceries_app/cubit/cubit/signup_cubit.dart';
import 'package:groceries_app/cubit/cubit/top_rated_cubit.dart';
import 'package:groceries_app/view/main_screen.dart';
import 'package:groceries_app/location_permission_screen.dart';
import 'package:groceries_app/model/location_repository.dart';
import 'package:groceries_app/splash_screen.dart';
import 'package:groceries_app/view/screen/favorite_screen.dart';
import 'package:groceries_app/view/screen/intro_screen.dart';
import 'package:groceries_app/view/screen/login_screen.dart';
import 'package:groceries_app/view/screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(create: (context) => LocationCubit(LocationRepository())),
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>SignupCubit()),
        BlocProvider(create: (context)=>TopRatedCubit()),
        BlocProvider(create: (context)=>BestSellingCubit()),
        BlocProvider(create: (context)=>MeatAndChikenCubit()),
        BlocProvider(create: (context)=>CartCubit()),
        BlocProvider(create: (context)=>BottomNavCubit()),
        BlocProvider(create: (context)=>FavoriteProductsCubit()),
        BlocProvider(create: (context)=>ExplorerCubit()),
        BlocProvider(create: (context)=>BeverageCubit()),
        BlocProvider(create: (context)=>FreshFrutesCubit()),
        BlocProvider(create: (context)=>FoodStuffCubit()),
        BlocProvider(create: (context)=>MeatAndFishCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       // home: LaunchDecider(), // 👈 This is important
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/intro': (context) => OnboardingScreen(),
          '/location': (context) => LocationScreen(),
          '/signup': (context) => SignupScreen(),
          '/login': (context) => LoginScreen(),
          '/home': (context) => MainScreen(),
          '/favorites': (context) => FavoritesScreen(), // ✅ أضف هذا السطر


        },
        //home: NavigationbarWidget(),
      ),
    );
  }
}
