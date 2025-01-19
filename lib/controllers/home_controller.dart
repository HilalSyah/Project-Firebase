import 'package:get/get.dart';

class HomeController extends GetxController {
  // Contoh properti dengan observables
  var userName = "Guest".obs;

  // Fungsi untuk menangani aksi tombol
  void addItem() {
    Get.snackbar(
      'Sukses',
      'Tambah Barang ditekan!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
