import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/widgets/widget_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Dira Mayzaro Dekantari";
  String kelas = "XI PPLG 1";
  String absen = "11";
  String email = "dira@gmail.com";

  @override
  void initState() {
    super.initState();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    Get.offAllNamed('/login');
  }

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Yakin ingin keluar dari akun ini?",
      backgroundColor: Colors.white,
      radius: 10,
      confirm: ElevatedButton(
        onPressed: () async {
          Get.dialog(
            const Center(child: CircularProgressIndicator(color: Colors.red)),
            barrierDismissible: false,
          );

          // Jalankan logout
          await logout();

          // Pindah ke halaman login
          Get.offAllNamed('/login');
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Ya", style: TextStyle(color: Colors.white)),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        child: const Text("Tidak", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // FOTO PROFIL
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.black,
                child: const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage("assets/dira.jpg"),
                ),
              ),

              const SizedBox(height: 20),

              // NAMA BESAR
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 5),

              // EMAIL
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),

              const SizedBox(height: 25),

              // CARD INFO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.yellow.shade700, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    infoRow(Icons.person, "Nama", name),
                    const Divider(color: Colors.grey, height: 20),
                    infoRow(Icons.school, "Kelas", kelas),
                    const Divider(color: Colors.grey, height: 20),
                    infoRow(Icons.confirmation_num, "Absen", absen),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // LOGOUT BUTTON
              CustomButton(
                text: "Logout",
                backgroundColor: Colors.red.shade700,
                textColor: Colors.white,
                onPressed: _showLogoutDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.yellow.shade700, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
