import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Controller/Login_Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/colors.dart';
import '../../Constants/image_strings.dart';
import '../Register/Register.dart';

class Loginfooter extends StatelessWidget {
  const Loginfooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GLogin = Get.put(LoginController());

    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: orange,
                  thickness: 1.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
              Text(
                'OR',
                style: TTexttheme.LRtext.titleMedium,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5.0),
              ),
              Expanded(
                child: Divider(
                  color: orange,
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
          ),
          Obx(
            () => GLogin.isLoading2.value
                ? CircularProgressIndicator(
                    color: orange,
                  )
                : SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.06,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        GLogin.GoogleLogin();
                      },
                      icon: Image(
                        image: AssetImage(sgoogle),
                        width: 40.0,
                        alignment: Alignment.centerLeft,
                      ),
                      label: Text(
                        'Google',
                        style: TTexttheme.LRtext.labelMedium,
                      ),
                    ),
                  ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TTexttheme.LRtext.titleMedium,
              ),
              Expanded(
                child: TextButton(
                  child: Text(
                    'Create Account',
                  ),
                  onPressed: () {
                    Get.to(Register());
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
