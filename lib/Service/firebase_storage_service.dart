import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProductImage(String filePath) async {
    try {
      // Menentukan path dan nama file di Firebase Storage
      Reference ref = _storage.ref().child('product_images/${DateTime.now().millisecondsSinceEpoch}');
      
      // Mengupload file
      await ref.putFile(File(filePath));
      
      // Mendapatkan URL file setelah upload selesai
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}
