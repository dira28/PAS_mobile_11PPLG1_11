// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
