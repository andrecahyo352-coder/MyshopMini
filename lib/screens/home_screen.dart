import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyShop Mini")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // semi-transparent
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Pilih Kategori",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: categories
                    .map((cat) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProductListScreen(category: cat.name),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(cat.icon, size: 40),
                                  const SizedBox(height: 8),
                                  Text(cat.name, textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
