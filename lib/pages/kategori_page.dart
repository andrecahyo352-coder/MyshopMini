import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/route_fade_slide.dart';
import 'kategori_elektronik_page.dart';
import 'kategori_fashion_page.dart';
import 'kategori_makanan_page.dart';
import 'kategori_olahraga_page.dart';

class KategoriPage extends StatelessWidget {
  KategoriPage({super.key});

  final List<Map<String, dynamic>> kategoriList = [
    {
      'nama': 'Elektronik',
      'icon': Icons.devices_other,
      'color': Colors.indigo,
      'page': KategoriElektronikPage(),
    },
    {
      'nama': 'Fashion',
      'icon': Icons.checkroom,
      'color': Colors.pinkAccent,
      'page': KategoriFashionPage(),
    },
    {
      'nama': 'Makanan',
      'icon': Icons.fastfood,
      'color': Colors.orange,
      'page': KategoriMakananPage(),
    },
    {
      'nama': 'Olahraga',
      'icon': Icons.sports_soccer,
      'color': Colors.green,
      'page': KategoriOlahragaPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(title: 'Kategori Produk'),
      backgroundColor: const Color(0xFFF5F6FA),
      body: ListView.builder(
        itemCount: kategoriList.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final kategori = kategoriList[index];
          return Card(
            elevation: 4,
            shadowColor: kategori['color'].withOpacity(0.3),
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(
                  context,
                  FadeSlideRoute(page: kategori['page']),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kategori['color'].withOpacity(0.1),
                      radius: 28,
                      child: Icon(
                        kategori['icon'],
                        color: kategori['color'],
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        kategori['nama'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // 🔹 Tombol kembali di bagian bawah
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
            elevation: 4,
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
