import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/produk_controller.dart';
import 'package:pas_mobile_11pplg1_11/widgets/produk_card.dart';

class HomeMobile extends StatelessWidget {
  HomeMobile({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Product List",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // Body
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.produkList.isEmpty) {
          return const Center(child: Text("Product not found"));
        }

        return RefreshIndicator(
          color: Colors.red,
          backgroundColor: Colors.yellow,
          onRefresh: () async {
            await controller.fetchProducts();
          },

          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72, // lebih pendek
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
