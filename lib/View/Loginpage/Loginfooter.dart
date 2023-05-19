import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';

import '../../Constants/colors.dart';
import '../../Constants/image_strings.dart';

class Loginfooter extends StatelessWidget {
  const Loginfooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20),
      child:Column(
        children: [
          Row(
            children: [
              Expanded(child:Divider(
                color:orange,
                thickness:1.0,
              ),),
              const Padding(padding:EdgeInsets.only(right:5.0),),
              Text('OR',style:TTexttheme.LRtext.titleMedium,),
              const Padding(padding:EdgeInsets.only(right:5.0),),
              Expanded(child:Divider(
                color:orange,
                thickness:1.0,
              ),),
            ],

          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
          ),
          SizedBox(
            width:size.width*0.8,
            height:size.height*0.06,
            child:OutlinedButton.icon(onPressed: (){},
              icon:  Image(image: AssetImage(sgoogle),width:40.0,
                alignment:Alignment.centerLeft,),
              label:Text('Google',style:TTexttheme.LRtext.labelMedium,),),
          ),
          const Padding(padding: EdgeInsets.only(bottom:40.0),),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style:TTexttheme.LRtext.titleMedium,),
              TextButton(
                child: Text(
                  'Create Account',
                ),
                onPressed: () {
                  // Get.to(Register());
                },
              ),
            ],

          )
        ],
      ),
    );
  }
}
