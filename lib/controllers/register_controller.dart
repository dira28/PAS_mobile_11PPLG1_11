import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  Future<bool> registerUser({
    required String username,
    required String password,
    required String fullName,
    required String email,
  }) async {
    isLoading.value = true;

    try {
      final url = Uri.parse('https://mediadwi.com/api/latihan/register-user');

      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
          'full_name': fullName,
          'email': email,
        },
      );

      var data = json.decode(response.body);

      if (data['status'] == true) {
        return true;
      } else {
        Get.snackbar(
          'Failed',
          data['message'] ?? 'Registration failed',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color(0xCCF44336),
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
