import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Dashboard!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Icon(
            Icons.dashboard,
            size: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
