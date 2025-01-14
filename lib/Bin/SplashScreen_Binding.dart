import 'package:get/get.dart';
import 'package:project_firebase/controllers/profile_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileControllerFB>(() => ProfileControllerFB());
  }
}
