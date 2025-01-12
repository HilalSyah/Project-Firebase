import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'name': 'cap', 'price': 'Rp 120.000', 'image': 'assets/cap.jpg'},
      {'name': 'Hoodie', 'price': 'Rp 250.000', 'image': 'assets/hoodie.jpg'},
      {'name': 'Jacket', 'price': 'Rp 300.000', 'image': 'assets/jackets.jpg'},
      {'name': 'polo shirt', 'price': 'Rp 80.000', 'image': 'assets/poloshirt.jpg'},
      {'name': 'shocks', 'price': 'Rp 80.000', 'image': 'assets/shocks.jpg'},
      {'name': 'shoes', 'price': 'Rp 80.000', 'image': 'assets/shoes.jpg'},
      {'name': 'sweater', 'price': 'Rp 80.000', 'image': 'assets/sweater.jpg'},
      {'name': 't shirt', 'price': 'Rp 80.000', 'image': 'assets/tshirt.jpg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5DC), // Warna krem
        elevation: 1,
        title: const Text(
          'Shop Baju Distro',
          style: TextStyle(color: Colors.brown),
        ),
        iconTheme: const IconThemeData(color: Colors.brown),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              name: product['name']!,
              price: product['price']!,
              imagePath: product['image']!,
              onAddToCart: () {
                Get.snackbar(
                  'Keranjang',
                  '${product['name']} berhasil ditambahkan ke keranjang!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.brown,
                  colorText: Colors.white,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

