import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/produk_controller.dart';
import 'mobile/home_mobile.dart';
import 'widescreen/home_widescreen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        productController.updateLayout(constraints);

        return Obx(
          () => productController.isMobile.value
              ? HomeMobile()
              : HomeWidescreen(),
        );
      },
    );
  }
}
