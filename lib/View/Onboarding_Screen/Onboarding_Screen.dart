import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Model/Model_onboarding.dart';
import 'package:food_ordering_app/View/Onboarding_Screen/OnboardingpageWidget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //onboarding page

    final pages = [
      onboardingpageWidget(
        model: OnBoardingModel(
            image: tonboardingImage1,
            title: onBoardingTitle1,
            subtitle: onBoardingSubTitle1,
            countertext: onBoardingCounter1,
            bgcolor: tonboardingPage1Color,
            height: size.height),
      ),
      onboardingpageWidget(
        model: OnBoardingModel(
            image: tonboardingImage2,
            title: onBoardingTitle2,
            subtitle: onBoardingSubTitle2,
            countertext: onBoardingCounter2,
            bgcolor: tonboardingPage2Color,
            height: size.height),
      ),
      onboardingpageWidget(
        model: OnBoardingModel(
            image: tonboardingImage3,
            title: onBoardingTitle3,
            subtitle: onBoardingSubTitle3,
            countertext: onBoardingCounter3,
            bgcolor: tonboardingPage3Color,
            height: size.height),
      )
    ];

    //controller for animateindicator
    final controller= LiquidController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 70,
            child: OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.brown),
                shape: const CircleBorder(),
                padding: EdgeInsets.all(20),
                onPrimary: white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration:
                    BoxDecoration(color: orange, shape: BoxShape.circle),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
              top: 40,
              right: 20,
              child: Text(
                'Skip',
                style: TTexttheme.onboardingtext.titleSmall,
              )),
          Positioned(
            bottom:20,
              child:AnimatedSmoothIndicator(
                activeIndex:controller.currentPage,
                count:3,
              ),),
        ],
      ),
    );
  }
}
