import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var kelas = "".obs;
  var absen = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    // Kalau belum ada, isi datamu
    name.value = prefs.getString("name") ?? "Dira Mayzaro Dekantari";
    kelas.value = prefs.getString("kelas") ?? "XI PPLG 1";
    absen.value = prefs.getString("absen") ?? "11";
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token"); // hapus token biar balik login

    Get.offAllNamed(AppRoutes.login);
  }
}
