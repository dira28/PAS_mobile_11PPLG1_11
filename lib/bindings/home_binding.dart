import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_11/controllers/home_controller.dart';
import 'package:pas_mobile_11pplg1_11/controllers/produk_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
