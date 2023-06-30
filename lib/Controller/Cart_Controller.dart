
import 'package:food_ordering_app/Controller/SelectedFood_Controller.dart';
import 'package:food_ordering_app/View/Dashboard/SelectedFood.dart';
import 'package:get/get.dart';

class CartController extends GetxController{


  final SelectedFood = Get.put(SelectedFoodController());

  void removeAll(){

  SelectedFood.cartItems.clear();

}

}