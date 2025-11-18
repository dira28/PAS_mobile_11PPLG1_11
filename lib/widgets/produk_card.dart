import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/produk_controller.dart';
import '../models/produk_model.dart';

class ProductCard extends StatelessWidget {
  final ProdukModel product;
  ProductCard({super.key, required this.product});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Image.network(product.image, height: 60),
        title: Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text("Price: \$${product.price}\n⭐ ${product.rating.rate}"),
        trailing: IconButton(
          icon: const Icon(Icons.bookmark_border),
          onPressed: () {
            //controller.addFavorite(product);
            Get.snackbar("Saved", "Added to Favorite");
          },
        ),
      ),
    );
  }
}
