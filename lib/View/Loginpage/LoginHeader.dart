import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/Constants/Theme.dart';

import '../../Constants/image_strings.dart';
import '../../Constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child: Image(
            image: const AssetImage(slogo),
            height: size.height * 0.2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Text(
          LoginTitle,
          style: TTexttheme.LRtext.titleLarge,
        ),
        Text(
          Loginsubtitle,
          style: TTexttheme.LRtext.titleMedium,
        ),
      ],
    );
  }
}
