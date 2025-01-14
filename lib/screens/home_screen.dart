import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'name': 'cap', 'price': 'Rp 120.000', 'image': 'https://images2.imgbox.com/b8/3c/nJRnAXRA_o.jpg'},
      {'name': 'Hoodie', 'price': 'Rp 250.000', 'image': 'https://images2.imgbox.com/a3/7e/UQa5dyjf_o.jpg'},
      {'name': 'Jacket', 'price': 'Rp 300.000', 'image': 'https://images2.imgbox.com/ca/81/FDor6ltJ_o.jpg'},
      {'name': 'polo shirt', 'price': 'Rp 80.000', 'image': 'https://images2.imgbox.com/58/24/XMtsbToB_o.jpg'},
      {'name': 'shocks', 'price': 'Rp 80.000', 'image': 'https://images2.imgbox.com/da/7b/Iv5JqfyO_o.jpg'},
      {'name': 'shoes', 'price': 'Rp 80.000', 'image': 'https://images2.imgbox.com/cb/15/wg1bYmvY_o.jpg'},
      {'name': 'sweater', 'price': 'Rp 80.000', 'image': 'https://images2.imgbox.com/7e/24/P5waexK3_o.jpg'},
      {'name': 't shirt', 'price': 'Rp 80.000', 'image': 'https://images2.imgbox.com/3e/c5/4Pbpxz4v_o.jpg'},
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
              imageUrl: product['image']!,
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

