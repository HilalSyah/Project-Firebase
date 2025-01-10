import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'My Favorites',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
