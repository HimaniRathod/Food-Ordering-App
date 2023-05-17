import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/View/Dashboard/Dashboard.dart';
import 'package:food_ordering_app/View/Loginpage/Loginpage.dart';
import 'package:food_ordering_app/View/Register/Register.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  //initialize string
  String username='';
  String password='';

  //formvalidation formkey
  GlobalKey<FormState> Lformkey =GlobalKey<FormState>();

  //for show password
  final RxBool ispasswordvisible=false.obs;
  RxBool obscureText = true.obs;

  //for visibility
  void visible(){
    ispasswordvisible.toggle();
    obscureText.toggle();
  }

  //for checkbox
  final isChecked = false.obs;
  void onCheckboxChange(bool? value) {
    isChecked.value = value!;
  }

  //Authentication .instance
  static LoginController instance = Get.find();
  //email,password
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onReady
    super.onReady();
    _user=Rx<User?>(auth.currentUser);
    //user will be notified through this bindstream
    _user.bindStream(auth.userChanges());
    // ever(_user,_initialScreen);
  }


  _initialScreen(User? user){
    if(user==null){
      print("Login page");
      Get.offAll(()=>Loginpage());
    }
    else{
      Get.offAll(()=>Dashboard());
    }
  }

  void login(){
    if (Lformkey.currentState!.validate()) {
      username = usernameController.text;
      password = passwordController.text;
      DLogin(username, password);
    }
  }

  void DLogin(String Email,String Password)async{
    try{
      await auth.signInWithEmailAndPassword(email:Email, password: Password);
      Get.to(Dashboard());
    }
    catch (e) {
      // Login failed
      String errorMessage = '';
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'invalid-email') {
          errorMessage = 'Incorrect username';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password';
        }
      }
      if (errorMessage.isNotEmpty) {
        Get.snackbar(
          'Login Status',
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // General error message
        Get.snackbar(
          'Login Status',
          'Login Failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

}