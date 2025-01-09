import 'package:get/get.dart';

class SignUpController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  bool validateEmptyFields(String username, String email, String password) {
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Semua field harus diisi';
      return false;
    }
    return true;
  }

  bool validateUsername(String username) {
    if (username.isEmpty) return true; // Skip jika kosong, sudah ditangani di validateEmptyFields
    if (username.length < 6) {
      errorMessage.value = 'Username minimal 6 karakter';
      return false;
    }
    return true;
  }

  bool validateEmail(String email) {
    if (email.isEmpty) return true; // Skip jika kosong
    if (!email.endsWith('@gmail.com')) {
      errorMessage.value = 'Email harus menggunakan @gmail.com';
      return false;
    }
    return true;
  }

  bool validatePassword(String password) {
    if (password.isEmpty) return true; // Skip jika kosong
    
    // Cek panjang minimal
    if (password.length < 8) {
      errorMessage.value = 'Password minimal 8 karakter';
      return false;
    }
    
    // Cek huruf kapital
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errorMessage.value = 'Password harus mengandung huruf kapital';
      return false;
    }
    
    // Cek simbol
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errorMessage.value = 'Password harus mengandung simbol';
      return false;
    }
    
    return true;
  }

  void signUp(String username, String email, String password) {
    errorMessage.value = '';
    
    // Cek apakah semua field sudah diisi
    if (!validateEmptyFields(username, email, password)) {
      return;
    }
    
    // Validasi masing-masing field
    if (!validateUsername(username)) return;
    if (!validateEmail(email)) return;
    if (!validatePassword(password)) return;

    isLoading.value = true;
    // Proses signup
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offAllNamed('/login');
    });
  }
}
