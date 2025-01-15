import 'package:get/get.dart';
import '../controllers/before_login_controller.dart';

class BeforeLoginBinding extends Bindings {
  @override
  void dependencies() {
    // Menginisialisasi controller BeforeLoginController
    Get.lazyPut<BeforeLoginController>(() => BeforeLoginController());
  }
}