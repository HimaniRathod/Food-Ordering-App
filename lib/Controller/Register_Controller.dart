
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  //initialize the string

  var name='';
  var email='';
  var phone='';
  var password='';

  //formvalidation formkey
  final GlobalKey<FormState> Rformkey =GlobalKey<FormState>();

  //loader
  final isLoading = false.obs;

  //for show password
  final RxBool ispasswordvisible=false.obs;
  RxBool obscureText = true.obs;

  //for visibility
  void visible(){
    ispasswordvisible.toggle();
    obscureText.toggle();
  }

  //Add new user in
  final auth = FirebaseAuth.instance;
  late Rx<User?> user;

  @override
  void onInit() {

    super.onInit();
    // user=Rx<User?>(auth.currentUser);
    // //user will be notified through this bindstream
    // user.bindStream(auth.userChanges());
    // ever(_user,_initialScreen);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  //for Login to dashboard
  void Signup(){

    if (Rformkey.currentState!.validate()) {
      name=nameController.text.trim();
      email=emailController.text.trim();
      phone=phoneController.text.trim();
      password=passwordController.text.trim();
      Register(email,password);
    }

  }


  void Register(String Email,String Pasword)async{

   try{
     UserCredential userCredential = await auth.createUserWithEmailAndPassword(email:Email, password:Pasword);

     Get.snackbar(
         'Registration Status',
         'User Registered Successfully',
       snackPosition: SnackPosition.BOTTOM,
       backgroundColor: Colors.green,
       colorText: Colors.white,);

     String uid = userCredential.user!.uid;// Retrieve the user's UID
     print(uid);
     DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
     databaseReference..child('UserData').child('ProfileData').child(uid).set({
       'name':name,
       'email':email,
       'phone':phone,
       'password':password,
     });

     print('datastored');
     clear();
   }


   catch(e){

     String errorMessage='';
     if (errorMessage.isNotEmpty) {
       Get.snackbar(
         'Registration Status',
         errorMessage,
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.red,
         colorText: Colors.white,
       );
     }
     else {
       // General error message
       Get.snackbar(
         'Registration Status',
         e.toString(),
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.red,
         colorText: Colors.white,
       );
     }
   }
  }

  void clear(){
    nameController.text='';
    emailController.text='';
    phoneController.text='';
    passwordController.text='';
  }

}