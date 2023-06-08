import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/Controller/FoodCategoryController.dart';
import 'package:food_ordering_app/View/Dashboard/Food_category.dart';
import 'package:get/get.dart';

import '../Constants/text_strings.dart';

class HomeController extends GetxController {

  final DatabaseReference  ref = FirebaseDatabase.instance.reference();

  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetData();
    fetchdata();
    Future.delayed(
      const Duration(milliseconds: 3000),
          () {
      isLoading.value = true;
      },
    );

  }

  //fetch the data from the jsonfile
  List Mainitems = [];
  List<String> names = [];
  List<String> ids =[];
  Future<void> fetchdata() async {
    Mainitems.clear();
    names.clear();
    ids.clear();
    String jsonString = await rootBundle.loadString(dataString);
    Map<String,dynamic> data = jsonDecode(jsonString);
    print(data);
    Mainitems = data['MainItem'];
    for(var item in Mainitems){
     String name = item['name'];
     String id = item['id'];
      names.add(name);
      ids.add(id);
    }
      print(names);
    print(ids);
    print(names.length);
  }

 //when click on item
  selectItem(int index){
    SelectedId.id = ids[index];
    Get.to(FoodCategory());
  }
  //initialize variable
    String name = '';
    String phone = '';
    String email = '';
    String photo='';

  Future<void> GetData() async {

    User? user = FirebaseAuth.instance.currentUser;
    name =user?.displayName?? '';
    phone =user?.phoneNumber?? '-----------';
    email =user?.email?? '';

    photo = user?.photoURL??'https://commons.wikimedia.org/wiki/File:Unknown_person.jpg';

    print('phone:$phone');

    //get uid
    // String UID = '';
    // if (user != null) {
    //   UID = user.uid;
    //   print(UID);
    // } else {
    //   print('No user is currently authenticated');
    // }


    // DatabaseEvent event =
    //     await ref.child('UserData').child('ProfileData').child(UID).once();
    // if (event.snapshot.value != null) {
    //   final data = event.snapshot.value as Map<dynamic, dynamic>;
    //   name = data['name'];
    //   phone = data['phone'];
    //   email = data['email'];
    // } else {
    //   print('Email not found or snapshot is empty');
    //   return null; // Handle the case when email is not found
    // }

  }


}

class SelectedId {

  static String id ='';
}
