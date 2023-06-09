import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:get/get.dart';

import '../../Constants/Theme.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 8.0,
            backgroundColor:red[200],
            child:Center(
              child:  IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20.0,
                  color: white,
                ),

              ),
            )
          ),
        ),
        titleSpacing: 100.0,
        title: Text('Cart',
            style: TTexttheme.HText.titleLarge, textAlign: TextAlign.center),
        actions: [
          Padding(padding: const EdgeInsets.all(10.0),
         child: CircleAvatar(
           radius: 20.0,
           backgroundColor: Colors.red[200],

           child: Center(

             child: IconButton(
               onPressed: () {},
               padding:EdgeInsets.all(0.98),
               icon: Icon(
                 Icons.cancel_outlined,
                 size: 28.0,
                 color: Colors.white,


               ),
             ),
           ),
         ),),



      ],

      ),


    );
  }
}
