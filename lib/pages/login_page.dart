import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg1_11/widgets/widget_textfield.dart';

import '../controllers/login_controller.dart';
import '../bindings/register_binding.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleLogin() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Warning ⚠️",
        "Username and password cannot be empty",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(12),
        borderRadius: 10,
        backgroundColor: const Color(0xFF861C1C),
        colorText: Colors.white,
      );
      return;
    }

    await controller.loginController(username, password);
  }

  Widget _cartIcon() {
    return Container(
      width: 140,
      height: 140,
      decoration: const BoxDecoration(
        color: Color(0xFF861C1C),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.shopping_cart,
        color: Color(0xFFFFD54F),
        size: 80,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),

              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Login to continue",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 35),

              _cartIcon(),
              const SizedBox(height: 45),

              // Username
              CustomTextField(
                textEditingController: usernameController,
                hintText: "Username",
              ),

              const SizedBox(height: 20),

              // Password
              CustomTextField(
                textEditingController: passwordController,
                hintText: "Password",
                obscureText: true,
                isPasswordField: true,
              ),

              const SizedBox(height: 25),

              controller.isLoading.value
                  ? const CircularProgressIndicator(color: Color(0xFFFFD54F))
                  : SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "LOGIN",
                        onPressed: _handleLogin,
                        backgroundColor: const Color(0xFF861C1C),
                        textColor: Colors.white,
                      ),
                    ),

              const SizedBox(height: 20),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account yet?",
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(width: 6),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterPage(), binding: RegisterBinding());
                    },
                    child: const Text(
                      "Register here",
                      style: TextStyle(
                        color: Color(0xFF861C1C),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
