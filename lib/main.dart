import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Controller/SelectedFood_Controller.dart';
import 'package:food_ordering_app/View/Dashboard/Food_category.dart';
import 'package:food_ordering_app/View/Dashboard/HomeScreen.dart';
import 'package:food_ordering_app/View/Loginpage/Loginpage.dart';
import 'package:food_ordering_app/View/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(

      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(

       MyApp(),

     );
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

