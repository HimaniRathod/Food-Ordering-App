import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Controller/Home_Controller.dart';
import 'package:get/get.dart';

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
  List<String> snames = [];
  String fetchid = SelectedId.id;

  Future<void> fetchCategoryData() async {

    SubItems.clear();
    snames.clear();
    print(fetchid);

    String jsonString = await rootBundle.loadString(dataString);
    Map<String, dynamic> data = jsonDecode(jsonString);

    List Mainitems = data['MainItem'];
    Mainitems.forEach((element) {
      Map<String, dynamic> obj = element;
      if (obj['id'] == fetchid) {
        List<dynamic> subItemsData = obj["subItems"] as List<dynamic>;
        SubItems.addAll(subItemsData);
      }
    });

    for (var items in SubItems) {
      String name = items['name'];
      snames.add(name);
    }
    print('==> $snames');
    print('😍 $SubItems ');
  }

  //when cclick the chip
  final HomeControl = Get.put(HomeController());

  Onselect(int index) {

    fetchid = HomeControl.ids[index];
    print(index);
    print(SelectedId.id);
    fetchCategoryData();
  }
}
