import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  late TextEditingController usernameController;
  late TextEditingController passwordController;

 final GlobalKey<FormState> formkey =GlobalKey<FormState>();
 
  void Login(){

    if (formkey.currentState!.validate()) {
      final String username = usernameController.text;
      final String password = passwordController.text;
    }
  }

}