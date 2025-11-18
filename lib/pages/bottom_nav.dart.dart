import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/home_controller.dart';
import 'package:pas_mobile_11pplg1_11/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_11/pages/home_page.dart';
import 'package:pas_mobile_11pplg1_11/pages/profile_page.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final homeController = Get.put(HomeController());

  final List<Widget> pages = [HomePage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[homeController.currentIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          onTap: (index) => homeController.changePage(index),
          selectedItemColor: Color(0xFF861C1C),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
