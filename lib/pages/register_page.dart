import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/register_controller.dart';
import 'login_page.dart';
import 'package:pas_mobile_11pplg1_11/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg1_11/widgets/widget_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController controller = Get.put(RegisterController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> _handleRegister() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final fullname = fullnameController.text.trim();
    final email = emailController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        fullname.isEmpty ||
        email.isEmpty) {
      Get.snackbar(
        'Warning ⚠️',
        'Semua field harus diisi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFF861C1C),
        colorText: Colors.white,
      );
      return;
    }

    final success = await controller.registerUser(
      username: username,
      password: password,
      fullName: fullname,
      email: email,
    );

    if (success) {
      Get.snackbar(
        "Berhasil",
        "Akun berhasil dibuat, silakan login.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade700,
        colorText: Colors.white,
      );

      Future.delayed(const Duration(seconds: 1), () {
        Get.to(() => LoginPage());
      });
    }
  }

  // 🔥 ICON kembali dimunculkan
  Widget _bookIcon() {
    return Container(
      width: 130,
      height: 130,
      decoration: const BoxDecoration(
        color: Color(0xFF861C1C),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person_add, color: Color(0xFFFFD54F), size: 70),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),

              const Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Register to continue',
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 30),

              _bookIcon(),

              const SizedBox(height: 35),

              CustomTextField(
                hintText: 'Username',
                textEditingController: usernameController,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                hintText: 'Full Name',
                textEditingController: fullnameController,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                hintText: 'Email',
                textEditingController: emailController,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                hintText: 'Password',
                textEditingController: passwordController,
                obscureText: true,
                isPasswordField: true,
              ),

              const SizedBox(height: 30),

              controller.isLoading.value
                  ? const CircularProgressIndicator(color: Color(0xFFFFD54F))
                  : SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'REGISTER',
                        onPressed: _handleRegister,
                        backgroundColor: const Color(0xFF861C1C),
                        textColor: Colors.white,
                      ),
                    ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Get.to(() => LoginPage());
                },
                child: const Text(
                  "Sudah punya akun? Login disini",
                  style: TextStyle(
                    color: Color(0xFF861C1C),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
