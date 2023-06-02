import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Controller/Dashboard_Controller.dart';
import 'package:food_ordering_app/Controller/Login_Controller.dart';
import 'package:food_ordering_app/View/Dashboard/HomeScreen.dart';
import 'package:food_ordering_app/View/Profile/Profile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  //dashboard controller
  final DashboardController DController = Get.put(DashboardController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialize the controller
    DController.currentIndex.value=0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Obx(() => IndexedStack(
          index:DController.currentIndex.value,
          children:[
            HomePage(),
            Profile()
          ],
        ),),
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor:orange,
          selectedItemColor:white,
          unselectedItemColor:brown,
          currentIndex:DController.currentIndex.value,
        onTap:(index)=>DController.changePage(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.home),
          label:'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.person),
              label:'Profile'),

        ],
      ),
    );
  }
}
