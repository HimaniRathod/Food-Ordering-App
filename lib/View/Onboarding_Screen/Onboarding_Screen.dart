import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  @override
  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
              pages:[
                Container(color:tonboardingPage1Color,
                padding:const EdgeInsets.all(10),
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image:AssetImage(tonboardingImage1),height:size.height*0.5,),
                    Column(
                      
                    )

                  ],
                ),
                ),
                Container(color:tonboardingPage2Color),
                Container(color:tonboardingPage3Color)
              ])
        ],
      ),
    );
  }
}
