


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Controller/FoodCategory_Controller.dart';
import 'package:get/get.dart';

class SelectedFoodController extends GetxController{


  final RxBool isLoading = false.obs;
  final RxInt FCount = 1.obs;

  //checkboxes
  final List<RxBool> checked = [false.obs,false.obs,false.obs];

  isChecked(bool? value,int index){

    checked[index].value = value!;
  }
  void IncreaseFood(){
    FCount.value = FCount.value +1 ;
  }

  void DecreaseFood(){
    FCount.value = FCount.value-1 ;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSelectedfooddata();
    fetchExtra();
    Future.delayed(const Duration(microseconds:300),(){
      isLoading.value= true;
    }
    );
  }


  String MainItem = '';
  String Subitem = '';
  String Price = '';
  void fetchSelectedfooddata() {

    MainItem = SelectedSubitemId.name;
    Subitem = SelectedSubitemId.subname["name"].toString();
    Price = SelectedSubitemId.price;

  print(Subitem);
  }

  List ExtrasThings =[];
  List Extrasname=[];
  List Extrasprice=[];
  void fetchExtra() async {

    String JsonString = await rootBundle.loadString(dataString);
    Map<String,dynamic> data = jsonDecode(JsonString);

    ExtrasThings = data["Extras"];

    for (var item in ExtrasThings){
      Extrasname.add(item["name"]);
      Extrasprice.add(item["Price"]);

    }
    print(Extrasname);
    print(Extrasprice);


  }





}