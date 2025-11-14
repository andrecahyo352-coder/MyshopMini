import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';


class KategoriMakananPage extends StatelessWidget {
  final List<Map<String, dynamic>> produkList = [
    {'nama': 'ayam dan ikan dll ', 'harga': 500000, 'gambar': 'assets/images/makanan1.jpg'},
    {'nama': 'Gado-Gado', 'harga': 25000, 'gambar': 'assets/images/makanan2.jpg'},
    {'nama': 'Rendang', 'harga': 25000, 'gambar': 'assets/images/makanan3.jpg'},
    {'nama': 'Soto', 'harga': 15000, 'gambar': 'assets/images/makanan4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: const GradientAppBar(title: 'Kategori Makanan'),
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
              color: Colors.orange.shade900,
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
