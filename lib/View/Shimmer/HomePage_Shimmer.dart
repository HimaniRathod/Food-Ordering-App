import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Constants/Theme.dart';
import '../../Constants/colors.dart';

class shimmer extends StatelessWidget {
  final Size size;
  final int itemCount;

  const shimmer({
    required this.size,
    required this.itemCount,
  });

  @override
  Widget ShowShimmer_2() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.count(
        // Replace the existing GridView content with shimmer effect
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: (size.width / 2) / (size.height / 2.9),
        children: List.generate(8, (index) {
          // Replace with shimmer effect for each grid item
          return Card(
            elevation: 16.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.19,
                    color: Colors.white, // Replace with desired color
                  ),
                  Padding(
                    padding: EdgeInsets.all(9.0),
                  ),
                  Container(
                    height: 18.0,
                    width: size.width * 0.6,
                    color: Colors.white, // Replace with desired color
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget ShowShimmer_1() {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 70.0,
            width: 70.0,
            color:Colors.white,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
        ),
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 10.0,
                width: 100.0,
                color:Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 10.0,
                width: 150.0,
                color:Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child:Container(
                height: 10.0,
                width: 120.0,
                color:Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
