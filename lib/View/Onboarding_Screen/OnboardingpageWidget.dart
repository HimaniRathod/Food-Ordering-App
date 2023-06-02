import 'package:flutter/cupertino.dart';

import '../../Constants/Theme.dart';
import '../../Model/onboarding_Model.dart';

class onboardingpageWidget extends StatelessWidget {
  const onboardingpageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: model.bgcolor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(model.title,
                  style: TTexttheme.onboardingtext.titleLarge),
              Text(
                model.subtitle,
                style: TTexttheme.onboardingtext.titleMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
          Text(model.countertext,
              style: TTexttheme.onboardingtext.titleLarge),
          const Padding(
            padding: EdgeInsets.only(bottom:100.0),
          ),
        ],
      ),
    );
  }
}
