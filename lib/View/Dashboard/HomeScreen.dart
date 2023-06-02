import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Controller/Login_Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Theme.dart';
import '../../Constants/colors.dart';
import '../../Constants/image_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var size;

  final LControl = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        backgroundColor:orange,
        title:Text('HomePage',style:TextStyle(
          color:white
        ),),
      ),
      body:Padding(
        padding:EdgeInsets.all(20),
        child:SingleChildScrollView(

          child:Column(
            children: [
              Row(
                children: [
                 Container(
                   height:60,
                   width:60,
                   child:IconButton(
                     onPressed: (){
                       LControl.Logout();
                     },
                     icon:Image(
                       image:AssetImage(
                           slogo
                       ),
                     ),
                   )

                 ),
                  const Padding(padding: EdgeInsets.only(right:20.0),),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text('Name Surname',style:TTexttheme.HText.titleLarge,),
                      // const Padding(padding:EdgeInsets.only(bottom:5.0),),
                      Text('xyz@gmail.com',style:TTexttheme.HText.titleSmall),
                      // const Padding(padding:EdgeInsets.only(bottom:5.0),),
                      Text('+91 4546789781',style:TTexttheme.HText.titleSmall)
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom:10),),
              Card(
                color:orange,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
                child:SizedBox(
                  height:size.height *0.16,
                  width:size.width,
                  child: Padding(
                    padding:EdgeInsets.all(20.0),
                    child:Row(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                       Image.asset(Cimg),
                        const Padding(padding:EdgeInsets.only(right:10.0),),
                        Column(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            TyperAnimatedTextKit(
                              text: ['...Have it in\n\t\t Your Day...'],
                              textAlign: TextAlign.justify,
                              textStyle:TTexttheme.HText.bodyMedium,// speed: Duration(milliseconds: 200),
                              pause: Duration(milliseconds: 1000),
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                              speed: Duration(milliseconds: 200),

                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5.0),),
                            FadeAnimatedTextKit(
                              text: ['Get your Order in 15 min!'],
                              textAlign: TextAlign.justify,
                              textStyle:TTexttheme.HText.bodySmall,// speed: Duration(milliseconds: 200),
                              pause: Duration(milliseconds: 500),
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                              // speed: Duration(milliseconds: 200),

                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
