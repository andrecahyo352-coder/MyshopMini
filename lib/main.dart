import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyShopMiniApp());
}

class MyShopMiniApp extends StatelessWidget {
  const MyShopMiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop Mini',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

