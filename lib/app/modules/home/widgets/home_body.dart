// ... other imports

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/modules/home/widgets/home_card.dart';
import '../../../global_widgets/adv.dart';
import '../../../global_widgets/text_theme.dart';
import '../category/lang.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Divider(
            height: 0,
            thickness: 10,
            color: Colors.black,
          ),
            
          CarouselSection(),
          SizedBox(height: 20),
           Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
            SizedBox(height: 10),
          Text(
            "     Information Technology Jobs",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
            
            textAlign: TextAlign.start,
          ),
            SizedBox(height: 10),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
            SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CategoriesRow(),
          ),
          
          SizedBox(height: 15),
           Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
            SizedBox(height: 20),
          Text(
            "     Recommend Jobs for you",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          // Use ListView.builder to display multiple CardViews
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                10, 
                // Replace with the actual number of cards you want to display
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: MyCardView(),
              );
            },
          ),
        ],
      ),
    );
  }
}
