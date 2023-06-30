import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';
import 'package:food_ordering_app/Controller/FoodCategory_Controller.dart';
import 'package:food_ordering_app/Model/Cart_Model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SelectedFoodController extends GetxController  {

//for loader
  final RxBool isLoading = false.obs;



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

  @override
  void dispose() {
    // Clean up resources or perform cleanup operations here
    super.dispose();

  }




  RxList<CartItem> cartItems = <CartItem>[].obs;
  List<CartItem> get items => cartItems;

  void addtoCart(CartItem item) {
    print('came into addtocart');
    item.checkedExtras = CheckedExtras.map((dynamic value) => value.toString()).toList();
    cartItems.add(item);
    update();
    print(cartItems[0]);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    update();
  }

  String MainItem = '';
  String Subitem = '';
  double Price = 0.0 ;
  double MainPrice = 0.0;
  double TotalPrice = 0.0;
  void fetchSelectedfooddata() {

    MainItem = SelectedSubitemId.name;
    Subitem = SelectedSubitemId.subname["name"].toString();
    Price = SelectedSubitemId.price.toDouble();
    MainPrice = Price;
    TotalPrice = Price;

  print(Subitem);
  }

  List ExtrasThings =[];
  List Extrasname=[];
  List Extrasprice=[];

  void fetchExtra() async {
    ExtrasThings.clear();
    Extrasname.clear();
    Extrasprice.clear();
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

  //for increase the count of food
  final RxInt FCount = 1.obs;
  void IncreaseFood(){
    FCount.value = FCount.value +1 ;
    print(FCount.value);
    print(TotalPrice);
    MainPrice = Calculatemainprice();

    print(MainPrice);

  }

  Calculatemainprice(){

    return  FCount.value * TotalPrice;
  }

  void DecreaseFood(){
    FCount.value = FCount.value -1 ;
    print(FCount.value);
    print(TotalPrice);
    MainPrice = Calculatemainprice();

    print(MainPrice);
  }

  //checkboxes



  final List<RxBool> checked = [false.obs,false.obs,false.obs];

  List CheckedExtras = [];
  isChecked(bool? value,int index){
    checked[index].value = value ?? false;
     TotalPrice = 10.0;

    print(MainPrice);
    if(checked[index].value == true){
      print('icount:${FCount.value}');
      MainPrice = MainPrice + (FCount.value*Extrasprice[index]);
      CheckedExtras.add(Extrasname[index]);
      // TotalPrice = TotalPrice + Extrasprice[index] ;
   }
    else{
      print('came else part');
      print('ecount:${FCount.value}');
      print('etotal :${TotalPrice}');
      MainPrice = MainPrice - (FCount.value*Extrasprice[index]);
      CheckedExtras.remove(Extrasname[index]);


      print(MainPrice);
      // totalprice();
      // TotalPrice = TotalPrice - Extrasprice[index];
      print('etotal2 :${TotalPrice}');

    }
    TotalPrice = calculateTotalPrice();
  }


  double calculateTotalPrice() {
    double totalPrice = 10.0;

    for (int i = 0; i < checked.length; i++) {
      if (checked[i].value) {
        totalPrice += (FCount.value * Extrasprice[i]);
      }
    }

    return totalPrice;
  }





}


