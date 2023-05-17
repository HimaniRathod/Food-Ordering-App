import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Controller/Register_Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/colors.dart';
import '../Loginpage/Loginpage.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    RegisterController CRegister = Get.put(RegisterController());

    //validation for name
    String? validatorName(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a Username';
      }
      return null;
    }
    //validation for email
    // Regular expression pattern for email validation
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    String? validatorEmail(String? value) {

      if (value == null || value.isEmpty) {
        return 'Please enter a Email';
      }
      if(!emailRegex.hasMatch(value)){
        return 'Enter Correct Email';
      }
      return null;
    }


    //validation for password
    String? validatorPhone(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a PhoneNo.';
      }
      if(value.length<10){
        return 'Enter correact PhoneNo.';
      }
      return null;
    }

    //validation for password
    String? validatvaorPassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a Password';
      }
      if(value.length<8){
        return 'Password Should be 8 Character';
      }
      return null;
    }
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 80.0),
              ),
              Text(
                'Register',
                style: TTexttheme.LRtext.titleLarge,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Text(
                'Create your new account',
                style: TTexttheme.LRtext.titleMedium,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key:CRegister.Rformkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: orange),
                          ),
                        ),
                        validator:validatorName,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: orange),
                          ),
                        ),
                        validator:validatorEmail,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone no',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: orange),
                          ),
                        ),
                        validator:validatorPhone,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      Obx(() =>                       TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              CRegister.visible();
                            },
                            icon: Obx(
                                  () => Icon(CRegister.ispasswordvisible.value
                                  ? Icons.remove_red_eye_sharp
                                  : Icons.visibility_off_sharp),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: orange)),
                        ),
                        obscureText:CRegister.obscureText.value,
                        validator:validatvaorPassword,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
              ),
              ElevatedButton(
                onPressed: () {
                  CRegister.Signup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // maximumSize:Size(size.width*0.5, size.height*0.2),
                  fixedSize: Size(size.width * 0.7, size.height * 0.06),
                  elevation: 5.0,
                ),
                child: Text(
                  'Sign up',
                  style: TTexttheme.LRtext.labelSmall,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: TTexttheme.LRtext.displaySmall,
                  ),
                  TextButton(
                    child: Text(
                      'Log in',
                    ),
                    onPressed: () {
                      Get.to(Loginpage());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
