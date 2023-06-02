import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Model/onboarding_Model.dart';
import 'package:food_ordering_app/View/Loginpage/Loginpage.dart';
import 'package:food_ordering_app/View/Onboarding_Screen/OnboardingpageWidget.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';


/*---Logic of onBoardingScreen */


class onboardingController extends GetxController {

  //controller for animateindicator in onboardingscreen..
  final Lcontroller = LiquidController();

  RxInt currentPage = 0.obs;

  //onboarding pages
  final pages = [
    onboardingpageWidget(model: OnBoardingModel(
        image: tonboardingImage1,
        title: onBoardingTitle1,
        subtitle: onBoardingSubTitle1,
        countertext: onBoardingCounter1,
        bgcolor: tonboardingPage1Color,
      ),),
    onboardingpageWidget(model: OnBoardingModel(
        image: tonboardingImage2,
        title: onBoardingTitle2,
        subtitle: onBoardingSubTitle2,
        countertext: onBoardingCounter2,
        bgcolor: tonboardingPage2Color,
      ),),
    onboardingpageWidget(model: OnBoardingModel(
        image: tonboardingImage3,
        title: onBoardingTitle3,
        subtitle: onBoardingSubTitle3,
        countertext: onBoardingCounter3,
        bgcolor: tonboardingPage3Color,
      ),)
  ];


  void onPageChangeCallback(int activePageIndex) {
    currentPage.value=activePageIndex;
  }

  //for skipping the pages
  skip()=>Lcontroller.jumpToPage(page:2);

  //come to nextpage
  animateTonNextSlide(){
    int nextpage = Lcontroller.currentPage +1;
    if (nextpage >= pages.length) {
      Get.offAll(Loginpage());
    } else {
      Lcontroller.animateToPage(page: nextpage);
    }
  }
}
