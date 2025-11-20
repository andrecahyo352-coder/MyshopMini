import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final IconData icon;
  final double price;

  Product({
    required this.name,
    required this.category,
    required this.icon,
    required this.price,
  });
}

