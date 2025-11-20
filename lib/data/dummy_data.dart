import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';

List<Category> categories = [
  Category(name: "Makanan", icon: Icons.fastfood),
  Category(name: "Minuman", icon: Icons.local_drink),
  Category(name: "Elektronik", icon: Icons.devices),
];

List<Product> products = [
  Product(name: "Burger", category: "Makanan", icon: Icons.fastfood, price: 25000),
  Product(name: "Roti", category: "Makanan", icon: Icons.bakery_dining, price: 15000),
  Product(name: "Kopi", category: "Minuman", icon: Icons.local_cafe, price: 12000),
  Product(name: "Jus", category: "Minuman", icon: Icons.local_drink, price: 10000),
  Product(name: "Laptop", category: "Elektronik", icon: Icons.laptop, price: 7000000),
  Product(name: "HP", category: "Elektronik", icon: Icons.phone_android, price: 3000000),
];
