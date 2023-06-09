import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Controller/Login_Controller.dart';
import 'package:food_ordering_app/View/Dashboard/Food_category.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/Theme.dart';
import '../../Constants/colors.dart';
import '../../Constants/image_strings.dart';
import '../../Controller/Home_Controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size;

  final LControl = Get.put(LoginController());
  final HomeControl = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar:AppBar(
      //   backgroundColor:orange,
      //   title:Text('HomePage',style:TextStyle(
      //     color:white
      //   ),),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: IconButton(
                    onPressed: () {
                      LControl.Logout();
                    },
                    icon: Image.network(HomeControl.photo),
                  ),),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HomeControl.name,
                      style: TTexttheme.HText.titleLarge,
                    ),
                    // const Padding(padding:EdgeInsets.only(bottom:5.0),),
                    Text(HomeControl.email, style: TTexttheme.HText.titleSmall),
                    // const Padding(padding:EdgeInsets.only(bottom:5.0),),
                    Text('+91 ${HomeControl.phone}',
                        style: TTexttheme.HText.titleSmall)
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Card(
              color: orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: size.height * 0.16,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Cimg,
                      fit:BoxFit.contain ),
                      const Padding(
                        padding: EdgeInsets.only(right: 1.0),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width:size.width*.5,
                            child: TyperAnimatedTextKit(
                              text: ['...Have it in\n\t\t Your Day...'],
                              textAlign: TextAlign.justify,
                              textStyle: TTexttheme.HText.bodyMedium,
                              // speed: Duration(milliseconds: 200),
                              pause: Duration(milliseconds: 1000),
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                              speed: Duration(milliseconds: 200),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                          ),
                          SizedBox(
                            width:size.width*.5,
                            child: FadeAnimatedTextKit(
                              text: ['Get your Order in 15 min!'],
                              textAlign: TextAlign.justify,
                              textStyle: TTexttheme.HText.bodySmall,
                              // speed: Duration(milliseconds: 200),
                              pause: Duration(milliseconds: 500),
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                              // speed: Duration(milliseconds: 200),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Obx(
                  () => HomeControl.isLoading.value
                  ? AspectRatio(
                aspectRatio: size.width / size.height,
                child: GridView.count(
                   padding: EdgeInsets.zero,
                  // physics: NeverScrollableScrollPhysics(),
                  clipBehavior:Clip.antiAliasWithSaveLayer,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio:
                  (size.width / 2) / (size.height / 3.4),
                  //for card height
                  children:
                  List.generate(HomeControl.names.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        HomeControl.selectItem(index);

                      },
                      child: Card(
                        elevation: 16.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(7.0),
                            ),
                            Container(
                              // height:size.height*0.2,
                              child: Image(
                                image: AssetImage(
                                  'assets/images/DashboardImage/FoodImage/${HomeControl.names[index]}.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(9.0),
                            ),
                            SizedBox(
                              width: size.width,
                              child: Text(
                                HomeControl.names[index],
                                style: TTexttheme.HText.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
                  : Center(
                child: CircularProgressIndicator(
                  color: orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
