import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final VoidCallback onupdate;
  final VoidCallback onDelete;

  const CustomCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.onupdate,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      color: Colors.blue.shade50, // Latar belakang kartu biru muda
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Semua elemen di kiri
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                imageUrl,
                height: 160, // Sesuaikan tinggi gambar
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Container(
                height: 80, // Tinggi placeholder
                color: Colors.blue.shade100, // Warna latar placeholder
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Judul
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Warna teks biru
              ),
            ),
            const SizedBox(height: 4.0),
            // Harga
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.blueAccent, // Warna teks harga biru
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            // Deskripsi
            Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                overflow: TextOverflow.ellipsis, // Menambahkan overflow untuk deskripsi panjang
                maxLines: 3, // Maksimum 3 baris
              ),
            ),
            const SizedBox(height: 8.0),
            // Tombol di bagian bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: onupdate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna tombol biru
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Padding kecil
                  ),
                  icon: const Icon(Icons.edit, size: 14, color: Colors.white), // Ikon lebih kecil
                  label: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white, fontSize: 12), // Ukuran font kecil
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Warna tombol merah
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Padding kecil
                  ),
                  icon: const Icon(Icons.delete, size: 14, color: Colors.white), // Ikon lebih kecil
                  label: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white, fontSize: 12), // Ukuran font kecil
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
