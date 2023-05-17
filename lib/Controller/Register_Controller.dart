

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  //formvalidation formkey
  final GlobalKey<FormState> Rformkey =GlobalKey<FormState>();

  //for show password
  final RxBool ispasswordvisible=false.obs;
  RxBool obscureText = true.obs;

  //for visibility
  void visible(){
    ispasswordvisible.toggle();
    obscureText.toggle();
  }


  //for Login to dashboard
  void Signup(){
    if (Rformkey.currentState!.validate()) {
      final String name = nameController.text;
      final String email = nameController.text;
      final String phone = nameController.text;
      final String password = passwordController.text;
    }
  }

}