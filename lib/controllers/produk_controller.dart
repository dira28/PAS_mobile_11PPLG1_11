import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/produk_model.dart';

class ProductController extends GetxController {
  var produkList = <ProdukModel>[].obs;
  var favoriteList = <ProdukModel>[].obs;
  var isLoading = false.obs;
  var isMobile = true.obs;

  @override
  void onInit() {
    fetchProducts();
    //loadFavorites();
    super.onInit();
  }

  void updateLayout(BoxConstraints c) {
    isMobile.value = c.maxWidth < 600;
  }

  void toggleFavorite(ProdukModel produk) {
    if (favoriteList.contains(produk)) {
      favoriteList.remove(produk);
    } else {
      favoriteList.add(produk);
    }
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final url = Uri.parse("https://fakestoreapi.com/products");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        produkList.value = produkModelFromJson(response.body);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
