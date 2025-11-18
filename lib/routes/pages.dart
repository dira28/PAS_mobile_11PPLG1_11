import 'package:get/route_manager.dart';
import 'package:pas_mobile_11pplg1_11/bindings/home_binding.dart';
import 'package:pas_mobile_11pplg1_11/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg1_11/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg1_11/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg1_11/pages/bottom_nav.dart.dart';
import 'package:pas_mobile_11pplg1_11/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_11/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_11/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_11/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginlBinding(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomnav,
      page: () => BottomNav(),
      binding: HomeBinding(),
    ),
  ];
}
