import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/View/Loginpage/Loginpage.dart';
import 'package:food_ordering_app/View/Onboarding_Screen/Onboarding_Screen.dart';
import 'package:food_ordering_app/View/Registrationpage/Registrationpage.dart';
import 'package:food_ordering_app/View/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,//don't shoe the debug label
      theme: ThemeData(
        primarySwatch:Colors.orange,
      ),
      home: Loginpage(),
    );
  }
}

