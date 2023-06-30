import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/Controller/Cart_Controller.dart';
import 'package:food_ordering_app/Controller/SelectedFood_Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/Cart_Model.dart';
import 'Cart.dart';

class SelectedFood extends StatefulWidget {
  const SelectedFood({Key? key}) : super(key: key);

  @override
  State<SelectedFood> createState() => _SelectedFoodState();
}

class _SelectedFoodState extends State<SelectedFood> {
  final SelectedFoodControl = Get.put(SelectedFoodController());
  final cartProvider = Get.find<SelectedFoodController>();



  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 8.0,
            backgroundColor: orange,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20.0,
                color: white,
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        titleSpacing: 100.0,
        title: Text(SelectedFoodControl.MainItem,
            style: TTexttheme.HText.titleLarge, textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // const Padding(padding: EdgeInsets.only(bottom:10.0),),
            Container(
              height: size.height * 0.25,
              width: size.width,
              child: Image(
                image: AssetImage(
                    'assets/images/DashboardImage/FoodImage/${SelectedFoodControl.MainItem}.png'),
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Row(
              // mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SelectedFoodControl.Subitem,
                      style: TTexttheme.HText.labelMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'RS. ${SelectedFoodControl.Price}',
                        style: TTexttheme.HText.labelSmall,
                        textAlign: TextAlign.right,
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5.0),
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                       Obx(() =>  InkWell(

                         onTap: SelectedFoodControl.FCount.value >1 ?() {

                       SelectedFoodControl.DecreaseFood();
                       }:null,

                         child: Icon(Icons.indeterminate_check_box,
                             color: SelectedFoodControl.FCount.value >1 ?orange:grey),
                       ),),
                        const Padding(padding: EdgeInsets.only(right: 10.0)),
                        Obx(() => Text(
                              SelectedFoodControl.FCount.toString(),
                              style: TTexttheme.HText.labelMedium,
                            )),
                        const Padding(padding: EdgeInsets.only(right: 10.0)),
                        InkWell(
                          onTap: () {
                            SelectedFoodControl.IncreaseFood();
                          },
                          child: Icon(Icons.add_box, color: orange),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10.0,
                        child: Image(
                          image: AssetImage(Time),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10.0)),
                      Text(
                        '15 - 20 min',
                        style: TTexttheme.HText.labelMedium,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Details",
                style: TTexttheme.HText.labelMedium,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5.0),
            ),
            Container(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, sit scelerisque vestibulum magnis. Auctor dolor, tincidunt enim pharetra. ',
                style: TTexttheme.HText.titleSmall,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Extras",
                style: TTexttheme.HText.labelMedium,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Obx(
              () => SelectedFoodControl.isLoading.value
                  ? Column(
                      children: List.generate(
                          SelectedFoodControl.Extrasname.length, (index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Align(
                                child: Row(
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        value: SelectedFoodControl
                                            .checked[index].value,
                                        onChanged: (value) =>
                                            SelectedFoodControl.isChecked(
                                                value, index),
                                      ),
                                    ),
                                    Text(
                                      SelectedFoodControl.Extrasname[index],
                                      style: TTexttheme.HText.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'RS. ${SelectedFoodControl.Extrasprice[index]}',
                              style: TTexttheme.HText.labelMedium,
                            ),
                          ],
                        );
                      }),
                    )
                  : CircularProgressIndicator(
                      color: orange,
                    ),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10.0),
                          backgroundColor: Colors.white54,
                        ),
                        onPressed: () {

                          final item = CartItem(mname:SelectedFoodControl.MainItem,name: SelectedFoodControl.Subitem, price: SelectedFoodControl.MainPrice,);
                          cartProvider.addtoCart(item);
                          Get.to(Cart());

                        },
                        child: Text(
                          'Add to Cart',
                          style: TTexttheme.HText.labelLarge,
                        ))),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                ),
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10.0),

                        ),
                        onPressed: () {},
                        child: Text(
                          'Place Order',
                          style: TTexttheme.HText.labelLarge,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
