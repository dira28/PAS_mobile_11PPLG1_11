import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/produk_controller.dart';
import 'package:pas_mobile_11pplg1_11/widgets/produk_card.dart';

class HomeWidescreen extends StatelessWidget {
  HomeWidescreen({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Product List (Widescreen)",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          color: Colors.red,
          backgroundColor: Colors.yellow,
          onRefresh: () async {
            await controller.fetchProducts();
          },

          child: GridView.builder(
            padding: const EdgeInsets.all(24),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 kolom biar lebih proper di layar besar
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.70, // tampilan proporsional
            ),
            itemCount: controller.produkList.length,
            itemBuilder: (context, index) {
              final produk = controller.produkList[index];
              return ProductCard(product: produk);
            },
          ),
        );
      }),
    );
  }
}
