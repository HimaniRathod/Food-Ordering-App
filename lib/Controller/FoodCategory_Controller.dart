import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Controller/Home_Controller.dart';
import 'package:get/get.dart';

import '../View/Dashboard/SelectedFood.dart';

class FoodCategoryController extends GetxController {
  final RxBool isLoading = false.obs;

  final RxInt isSelected = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategoryData();
    Future.delayed(const Duration(microseconds: 3000), () {
      isLoading.value = true;
    });
  }

  //fetch the data from the jsonfile
  List SubItems = [];
  List Subid = [];
  List Prices = [];
  List<String> snames = [];
  String fetchid = SelectedId.id;
  String fname = ''; //just for testing

  Future<void> fetchCategoryData() async {

    SubItems.clear();
    Subid.clear();
    Prices.clear();
    snames.clear();
    print(fetchid);

    String jsonString = await rootBundle.loadString(dataString);
    Map<String, dynamic> data = jsonDecode(jsonString);

    List Mainitems = data['MainItem'];
    Mainitems.forEach((element) {
      Map<String, dynamic> obj = element;
      if (obj['id'] == fetchid) {
        fname =  obj["name"];//for taking assets images
        List<dynamic> subItemsData = obj["subItems"] as List<dynamic>;
        SubItems.addAll(subItemsData);

      }

    });

    for (var items in SubItems) {
      String name = items['name'];
      int price = items['price'];
      snames.add(name);
      Prices.add(price);
    }
    print('==> $Prices');
    print('😍 $SubItems ');
  }

  //when cclick the chip
  final HomeControl = Get.put(HomeController());

  OnsCategoryselect(int index) {

    fetchid = HomeControl.ids[index];
    print(index);
    print(SelectedId.id);
    fetchCategoryData();
  }

  OnSelectItem(int index){

    SelectedSubitemId.name = fname;
    SelectedSubitemId.subname = SubItems[index];
    SelectedSubitemId.price = Prices[index].toString();

    Get.to(SelectedFood());
  }
}

class SelectedSubitemId {

  static String name ='';
  static dynamic subname ;
  static String price = '';
}

