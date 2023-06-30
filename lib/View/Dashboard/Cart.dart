import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Controller/Cart_Controller.dart';
import 'package:food_ordering_app/Controller/SelectedFood_Controller.dart';
import 'package:get/get.dart';

import '../../Constants/Theme.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  var size;
  final SelectedFoodControl = Get.put(SelectedFoodController());
  final SelectedFoodController selectedFood = Get.find();
  final CartControl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:white,
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
               onPressed: () {
                 CartControl.removeAll();
               },
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
      body:Obx(() => SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child:Column(
            children:List.generate(selectedFood.cartItems.length, (index) {
              final cartItem = selectedFood.cartItems[index];
              List<String>? extras = cartItem.checkedExtras;
              return Card(
                  elevation:0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(10.0),
                  ),
                  color:blue,
                  child:Padding(
                    padding:EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:69,
                          width:94,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10.0),
                            // color:Colors.pink,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child:Image(
                            image:AssetImage('assets/images/DashboardImage/FoodImage/${cartItem.mname}.png',),
                            fit:BoxFit.fitWidth,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right:10.0),),
                        Container(

                          width:size.width*.48,
                          child:Row(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [

                              Expanded(child:Align(
                                alignment:Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItem.name,style:TTexttheme.HText.titleMedium,textAlign:TextAlign.left,),
                                    extras != null && extras.isNotEmpty  ?Column(
                                       crossAxisAlignment:CrossAxisAlignment.start,
                                       children:List.generate(extras.length, (index) =>
                                           Text(extras[index],style:TTexttheme.HText.titleSmall,),),
                                     ):
                                     Text(''),
                                  ],
                                ),
                              ),),
                              Padding(padding:EdgeInsets.only(right: 5.0),),
                              Align(
                                alignment:Alignment.centerRight,
                                child:Column(
                                  crossAxisAlignment:CrossAxisAlignment.end,
                                  children: [
                                    Text('Rs.${cartItem.price}',style: TTexttheme.HText.labelSmall,textAlign:TextAlign.right,),
                                    const  Padding(padding: EdgeInsets.only(bottom:5.0),),
                                    CircleAvatar(
                                      backgroundColor:orange,
                                      radius:20,
                                      child: IconButton(onPressed:(){
                                        selectedFood.removeItem(index);
                                      }, icon:Icon(Icons.delete_rounded,color:Colors.white,)),
                                    )
                                  ],
                                ),
                              ),


                            ],
                          ),
                        )
                      ],
                    ),
                  )
              );
            })
        ),
      ))

    );
  }
}
