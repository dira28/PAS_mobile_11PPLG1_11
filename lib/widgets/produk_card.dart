import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/pages/mobile/produk_detail_page.dart';
import '../models/produk_model.dart';
import '../controllers/produk_controller.dart';

class ProductCard extends StatelessWidget {
  final ProdukModel product;

  ProductCard({super.key, required this.product});

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image, height: 120)),

            const SizedBox(height: 10),

            // Title
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            const SizedBox(height: 6),

            // Description (baru)
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 8),

            // Price
            Text(
              "\$${product.price}",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("⭐ ${product.rating.rate}"),

                // Favorite
                Obx(() {
                  final isFav = productController.favoriteList.any(
                    (item) => item.id == product.id,
                  );

                  return GestureDetector(
                    onTap: () {
                      if (isFav) {
                        productController.favoriteList.removeWhere(
                          (item) => item.id == product.id,
                        );
                      } else {
                        productController.favoriteList.add(product);
                      }
                    },
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.black,
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
