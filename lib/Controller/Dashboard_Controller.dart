
import 'package:get/get.dart';

class DashboardController extends GetxController{

  //bottomnavigation bar
  //declare current selected index
  var currentIndex = 0.obs;

  //update the selected index
    void changePage(int index){
      currentIndex.value = index;
    }



}