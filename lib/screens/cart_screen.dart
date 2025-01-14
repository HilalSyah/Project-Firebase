import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.brown,
      ),
      body: Obx(
        () {
          if (cartController.cartItems.isEmpty) {
            return const Center(
              child: Text('Keranjang Anda kosong'),
            );
          } else {
            return ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartController.cartItems[index];
                return ListTile(
                  leading: Image.network(item.imageUrl),
                  title: Text(item.name),
                  subtitle: Text(item.price),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cartController.removeFromCart(item);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
