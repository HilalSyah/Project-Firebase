import 'package:get/get.dart';
import 'package:project_firebase/controllers/profile_controller.dart';
import 'package:project_firebase/Service/firebase_api.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileControllerFB>(() => ProfileControllerFB());
    Get.lazyPut<FirebaseApi>(() => FirebaseApi());
  }
}
