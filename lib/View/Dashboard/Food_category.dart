import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/FoodCategory_Controller.dart';
import '../../Controller/Home_Controller.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({Key? key}) : super(key: key);


  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  var size;

  final HomeControl = Get.put(HomeController());
  final FoodControl = Get.put(FoodCategoryController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 25.0),
              ),
              Searchbar(),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
              ),
              SingleChildScrollView(
                scrollDirection:Axis.horizontal,

                child:Row(

                  children: List.generate(HomeControl.names.length, (index) {

                    return GestureDetector(

                      onTap: () {},
                      child:Container(
                        padding:EdgeInsets.only(right:15.0),
                        child:Obx(()=>ChoiceChip(
                          selected: FoodControl.isSelected.value == HomeControl.names.indexWhere((element) => element == HomeControl.names[index]),
                          shape:FoodControl.isSelected.value == HomeControl.names.indexWhere((element) => element == HomeControl.names[index])
                              ? RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(15.0),


                          ):RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(15.0),
                              side:BorderSide(color:dgreen)

                          ),
                          padding:EdgeInsets.fromLTRB(5, 10, 5, 10),
                          selectedColor:Color.lerp(Color(0xffF88704),Color(0xffE1701D), 0.81),
                          backgroundColor:Colors.white,
                          onSelected: (bool selected) {
                            setState(() {
                              FoodControl.isSelected.value = selected ? index:HomeControl.ids.indexWhere((element) => element == FoodControl.fetchid);
                            });
                            FoodControl.OnsCategoryselect(HomeControl.names.indexWhere((element) => element == HomeControl.names[index]));
                          },

                          label: Text(HomeControl.names[index],style:TTexttheme.HText.displaySmall,),
                          avatar:CircleAvatar(
                            radius:50.0,
                            backgroundImage:AssetImage( 'assets/images/DashboardImage/FoodImage/${HomeControl.names[index]}.png',
                                ),
                          ),
                        ),)
                      )
                    );
                  },),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom:10.0),),
              Obx(
                () => FoodControl.isLoading.value
                    ? AspectRatio(
                        aspectRatio: size.width / size.height,
                        child: GridView.count(
                          padding: EdgeInsets.zero,
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio:
                              (size.width /2.0) / (size.height / 3.4),
                          //for card height
                          children:
                              List.generate(FoodControl.snames.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                FoodControl.OnSelectItem(index);
                              },
                              child: Card(
                                elevation: 16.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                clipBehavior:Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:size.width,
                                       height:MediaQuery.of(context).size.height * (120.0 / 812.0),
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/DashboardImage/FoodImage/${FoodControl.fname}.png',
                                        ),
                                        fit:BoxFit.fill,


                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SizedBox(
                                          width: size.width,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FoodControl.snames[index],
                                                style: TTexttheme
                                                    .HText.titleMedium,
                                              ),
                                               Text(
                                                'Rs. ${FoodControl.Prices[index]}',
                                                style:
                                                    TTexttheme.HText.titleSmall,
                                              ),
                                            ],
                                          )),
                                    )
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
              )
            ],
          )),
    );
  }

  //searchbar
  Widget Searchbar() {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: TextField(
        textAlign: TextAlign.left,
        style: TTexttheme.HText.displayMedium,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: false,
          isDense: true,
          /* -- Text and Icon -- */
          hintText: "Search Your Favourite Food",
          hintTextDirection: TextDirection.rtl,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
                child: const Icon(
                  Icons.search,
                  color: black,
                  size: 25.0,
                ),
                onTap: () {}),
          ),
          contentPadding: const EdgeInsets.all(15.0), // OutlineInputBorder
        ), // InputDecoration
      ),
    );
  }
}
