import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/Controller/Login_Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Theme.dart';
import '../../Constants/colors.dart';
import 'Loginpage.dart';

class Forgetpassword extends StatelessWidget {
   Forgetpassword({Key? key}) : super(key: key);

  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    final FLogin = Get.put(LoginController());

    //validation for email
    // Regular expression pattern for email validation
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    String? validatorEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a Email';
      }
      if (!emailRegex.hasMatch(value)) {
        return 'Enter Correct Email';
      }
      return null;
    }

    return Scaffold(
      body: Container(
        alignment:Alignment.center,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(fpass),
              height: size.height * 0.2,
            ),
            Padding(padding:EdgeInsets.only(bottom:20.0),),
            Container(
              padding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key:FLogin.fformkey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                      controller: FLogin.emailController,
                      validator: validatorEmail,
                    ),
                  ),
                  Padding(padding:EdgeInsets.only(bottom:20.0),),
                  Align(
                    alignment:Alignment.centerLeft,
                    child:Row(
                      children: [
                        Text('Back To',),
                        Padding(padding:EdgeInsets.only(bottom:5.0),),
                        TextButton(
                          child: Text(
                            'Login',
                          ),
                          onPressed: () {
                            Get.to(Loginpage());
                          },
                        ),

                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                        FLogin.Send();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fixedSize: Size(size.width * 0.7, size.height * 0.06),
                      elevation: 5.0,
                    ),
                    child: Text(
                      'Send',
                      style: TTexttheme.LRtext.labelSmall,
                    ),
                  ),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
