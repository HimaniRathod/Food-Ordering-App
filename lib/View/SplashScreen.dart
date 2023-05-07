import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Onboarding_Screen/Onboarding_Screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {


  @override
  void initState() {
    //set time to load the next page
    Future.delayed(
      Duration(seconds: 8),
          () {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Onboarding_Screen(),
        ));
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final size=MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'Animated_Logo.json',
          width: size.width * 0.8,
          height: size.height,
          repeat:false,
        ),
      ),
    );
  }
}
