
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/View/Dashboard/Dashboard.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  //TextEditing Controller
   final usernameController = TextEditingController();
   final passwordController = TextEditingController();

  //formvalidation formkey
  final formkey =GlobalKey<FormState>();

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
   void onCheckboxChange(bool? value) async {

     isChecked.value = value!;
     SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString('email', usernameController.text);
     pref.setString('password', passwordController.text);
     pref.setBool('rememberme', isChecked.value);
   }


   //if we used remeberme
   void loadUserPassword() async {
     try {
       SharedPreferences pref = await SharedPreferences.getInstance();

       var email = pref.getString('email') ?? '';
       var password = pref.getString('password') ?? '';
       var remember = pref.getBool('rememberme') ?? false;

       if (remember) {
         isChecked.value = true;
         usernameController.text = email;
         passwordController.text = password;
       }
     } catch (e) {
       print(e);
     }
   }


   //Authentication .instance
  static LoginController get instance => Get.find();

  //email,password
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {

    super.onInit();
    loadUserPassword();
    _user=Rx<User?>(auth.currentUser);
    //user will be notified through this bindstream
    _user.bindStream(auth.userChanges());
    // ever(_user,_initialScreen);
  }


  // _initialScreen(User? user){
  //   if(user==null){
  //     print("Login page");
  //     Get.offAll(()=>Loginpage());
  //   }
  //   else{
  //     Get.offAll(()=>Dashboard());
  //   }
  // }

  void login(){
    if (formkey.currentState!.validate()) {
      var username = usernameController.text.trim();
      var password = passwordController.text.trim();
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

  //Google SignIn
  GoogleSignIn googelsignIn = GoogleSignIn();
  Future<void> GoogleLogin() async {
    try {
      GoogleSignInAccount? googleUser = await googelsignIn.signIn();
      if (googleUser == null) {
        return;
      }

      GoogleSignInAuthentication gooleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gooleAuth.accessToken,
          idToken: gooleAuth.idToken
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      User? user = userCredential.user;

      if (user !=null) {
        print(user.displayName);
        print(user.email);
        print(user.photoURL);

        Get.to(Dashboard());
      }
    } catch (e) {
      print(e);
    }
  }
}