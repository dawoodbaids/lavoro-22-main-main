// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/custom_drawer.dart';
 // Make sure to import the BottomNavBar widget
import '../widgets/buttom_bar.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_body.dart';
import 'Job_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: const CustomDrawer(),
      appBar: const HomeAppBar(),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const JobView()); // Navigates to the Create class
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onTabChange: (index) {
          switch (index) {
            case 0:
              // Do nothing or handle the Home tab as needed
              break;
            case 1:
              Get.toNamed('/chat'); // Navigate to ChatUser page
              break;
            case 2:
              Get.toNamed('/user-profile'); // Navigate to UserProfileView page
              break;
            case 3:
              Get.toNamed('/emp_home'); // Navigate to EmpHomeView page
              break;
            default:
              // Handle default case or do nothing
              break;
          }
        },
      ),
    );
  }
}
