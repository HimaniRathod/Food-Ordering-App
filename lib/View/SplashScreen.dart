import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/View/Dashboard/Dashboard.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Onboarding_Screen/Onboarding_Screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {



  @override
  initState()  {
    super.initState();

    //for navigation
    Gotonext();
  }

  @override
  Widget build(BuildContext context) {
   final size=MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AnimationString,
          width: size.width * 0.8,
          height: size.height,
          repeat:false,
        ),

      ),
    );
  }

  Future<void> Gotonext() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool? check = pref.getBool('OnceLogin');
    print(check);
    if(check == true ){
      Future.delayed(
        Duration(seconds:7),
            () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
        },
      );
    }
    //set time to load the next page
    Future.delayed(
      Duration(seconds:7),
          () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Onboarding_Screen(),
        ));
      },
    );
  }
}
