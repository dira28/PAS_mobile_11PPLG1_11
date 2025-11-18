import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/produk_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite")),
      body: Obx(() {
        if (productController.favoriteList.isEmpty) {
          return const Center(child: Text("Belum ada favorite"));
        }

        return ListView.builder(
          itemCount: productController.favoriteList.length,
          itemBuilder: (context, index) {
            final item = productController.favoriteList[index];

            return ListTile(
              leading: Image.network(item.image, height: 40),
              title: Text(item.title),
              subtitle: Text("\$ ${item.price}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  productController.favoriteList.remove(item);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
