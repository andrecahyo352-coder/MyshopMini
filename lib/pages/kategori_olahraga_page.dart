import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';


class KategoriOlahragaPage extends StatelessWidget {
  final List<Map<String, dynamic>> produkList = [
    {'nama': 'Sepatu Lari', 'harga': 250000, 'gambar': 'assets/images/olahraga1.jpg'},
    {'nama': 'Bola Sepak', 'harga': 80000, 'gambar': 'assets/images/olahraga2.jpg'},
    {'nama': 'Raket Badminton', 'harga': 120000, 'gambar': 'assets/images/olahraga3.jpg'},
    {'nama': 'Matras Yoga', 'harga': 70000, 'gambar': 'assets/images/olahraga4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: const GradientAppBar(title: 'Kategori Olahraga'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: produkList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.78,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final produk = produkList[index];
            return Card(
              color: Colors.green.shade900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(produk['gambar'], fit: BoxFit.cover, width: double.infinity),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(produk['nama'],
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("Rp ${produk['harga']}",
                            style: const TextStyle(color: Colors.cyanAccent)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context); // 👈 kembali ke halaman sebelumnya
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          label: const Text(
            "Kembali ke Halaman Sebelumnya",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
