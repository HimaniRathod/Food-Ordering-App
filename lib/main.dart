import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/View/Dashboard/Dashboard.dart';
import 'package:food_ordering_app/View/Dashboard/HomeScreen.dart';
import 'package:food_ordering_app/View/Loginpage/Forgetpassword.dart';
import 'package:food_ordering_app/View/Loginpage/Loginpage.dart';
import 'package:food_ordering_app/View/Register/Register.dart';
import 'package:food_ordering_app/View/SplashScreen.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,//don't shoe the debug label
      theme: ThemeData(
        primarySwatch:Colors.orange,
      ),
      home:Splash_Screen(),

    );
  }
}

