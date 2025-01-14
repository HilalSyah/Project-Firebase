import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(File file, String path) async {
    try {
      // Menyimpan file ke Firebase Storage
      TaskSnapshot snapshot = await _storage.ref(path).putFile(file);
      
      // Mendapatkan URL gambar setelah berhasil diunggah
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }
}
