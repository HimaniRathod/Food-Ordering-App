import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Controller/onboarding_Controller.dart';
import 'package:food_ordering_app/Model/onboarding_Model.dart';
import 'package:food_ordering_app/View/Onboarding_Screen/OnboardingpageWidget.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding_Screen extends StatelessWidget {
   Onboarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    onboardingController controller = onboardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: controller.pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback:controller.onPageChangeCallback,
            liquidController:controller.Lcontroller,
          ),
          Positioned(
            bottom: 70,
            child: OutlinedButton(
              onPressed: () => controller.animateTonNextSlide(),
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
              child: TextButton(
                onPressed:() =>controller.skip(),
                child:Text('Skip',
                  style: TTexttheme.onboardingtext.titleSmall,
                ))),
          Obx(
            ()=> Positioned(
              bottom:20,
              child:AnimatedSmoothIndicator(
                  activeIndex:controller.currentPage.value,
                  count:3,
                  effect:WormEffect(
                    activeDotColor:orange,
                  )
              ),),
          ),
        ],
      ),
    );
  }


}
