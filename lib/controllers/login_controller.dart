import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_11/pages/bottom_nav.dart.dart';
import 'dart:convert';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginSuccess = false.obs;

  var userName = "".obs;
  var userEmail = "".obs;

  Future<void> loginController(String username, String password) async {
    isLoading.value = true;

    final url = Uri.parse('https://mediadwi.com/api/latihan/login');

    try {
      final response = await http.post(
        url,
        body: {'username': username, 'password': password},
      );

      final data = json.decode(response.body);

      if (data['status'] == true) {
        Get.snackbar(
          "Berhasil",
          "Login sukses!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        await Future.delayed(const Duration(milliseconds: 800));

        Get.offAll(() => BottomNav());
      } else {
        Get.snackbar(
          "Gagal",
          data['message'] ?? 'Login gagal',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
