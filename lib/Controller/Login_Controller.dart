
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/View/Dashboard/Dashboard.dart';
import 'package:food_ordering_app/View/Loginpage/Loginpage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Theme.dart';
import '../Constants/colors.dart';

class LoginController extends GetxController{

  //TextEditing Controller
   final usernameController = TextEditingController();
   final passwordController = TextEditingController();

   var username='';
   var password='';



  //formvalidation formkey
   final lformkey =GlobalKey<FormState>();

// Loading state
  final isLoading1 = false.obs;
  final isLoading2 =false.obs;



  //for show password
  final RxBool ispasswordvisible=false.obs;
  RxBool obscureText = true.obs;

  //for visibility
  void visible(){
    ispasswordvisible.toggle();
    obscureText.toggle();
  }

  //for checkbox(rememberme)
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
       print('entered');
       SharedPreferences pref = await SharedPreferences.getInstance();

       var email = pref.getString('email') ?? '';
       var password = pref.getString('password') ?? '';
       var remember = pref.getBool('rememberme') ?? false;

       if (remember) {
         print('entered2');

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
    // _user=Rx<User?>(auth.currentUser);
    // //user will be notified through this bindstream
    // _user.bindStream(auth.userChanges());
    // // ever(_user,_initialScreen);
  }

   @override
   void dispose() {
     usernameController.dispose();
     passwordController.dispose();
     super.dispose();
   }

  @override
  void onClose() {
    // Perform cleanup tasks or release resources here
    super.onClose();
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
    if (lformkey.currentState!.validate()) {
       username = usernameController.text.trim();
       password = passwordController.text.trim();
      DLogin(username, password);
    }
  }

  void DLogin(String Email,String Password)async{
    try{

      await auth.signInWithEmailAndPassword(email:Email, password: Password);
      isLoading1.value = true;
      //
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('OnceLogin', true);
      Future.delayed(Duration(seconds:2),(){
        isLoading1.value = false;
        Get.offAll(Dashboard());
      });

    }
    catch (e) {
      isLoading1.value = false;
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
    final GoogleSignIn googelsignIn = GoogleSignIn();
    Future<void> GoogleLogin() async {
      try {

        final GoogleSignInAccount? googleUser = await googelsignIn.signIn();
        if (googleUser == null) {
          return;
        }

        final GoogleSignInAuthentication gooleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gooleAuth.accessToken,
            idToken: gooleAuth.idToken
        );

        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(credential);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('OnceLogin', true);
        User? user = userCredential.user;

        if (user !=null) {
          print(user.displayName);
          print(user.email);
          print(user.photoURL);
          print(user.phoneNumber);

          isLoading2.value = true;
          Future.delayed(Duration(seconds:2),(){
            isLoading2.value = false;
            Get.offAll(Dashboard());});
        }
      } catch (e) {
        print(e);
      }
    }

    //logout
   Future<void> Logout()async{

      await auth.signOut();
      await googelsignIn.signOut();
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('OnceLogin', false);
      Get.offAll(Loginpage());
   }

   //forget pasword
   final emailController = TextEditingController();
    var email='';

   //formvalidation formkey
   final fformkey =GlobalKey<FormState>();

    void Send()async{
      if(fformkey.currentState!.validate()){
        email = emailController.text.trim();
      }
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        // Utils().toastmessage('Please check your email to reset your password');
        Get.defaultDialog(
          title:'Password Reset Email Sent',
            titleStyle:TTexttheme.Dtext.titleLarge,
            buttonColor:orange,
            content: Text('Please check your email to reset your password.',
            style:TTexttheme.Dtext.titleLarge,),
            confirm: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
        ),);
      }
      catch(e){

        print(e);
      }
    }
}