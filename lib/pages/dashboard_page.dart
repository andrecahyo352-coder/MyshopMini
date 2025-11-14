import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/route_fade_slide.dart';

// Import halaman kategori & profil & kontak
import 'kategori_elektronik_page.dart';
import 'kategori_fashion_page.dart';
import 'kategori_makanan_page.dart';
import 'kategori_olahraga_page.dart';
import 'profil_page.dart';
import 'kategori_page.dart';
import 'kontak_page.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> kategoriList = [
    {
      'nama': 'Elektronik',
      'icon': Icons.devices_other,
      'color': Colors.indigo,
      'page': KategoriElektronikPage()
    },
    {
      'nama': 'Fashion',
      'icon': Icons.checkroom,
      'color': Colors.pinkAccent,
      'page': KategoriFashionPage()
    },
    {
      'nama': 'Makanan',
      'icon': Icons.fastfood,
      'color': Colors.orange,
      'page': KategoriMakananPage()
    },
    {
      'nama': 'Olahraga',
      'icon': Icons.sports_soccer,
      'color': Colors.green,
      'page': KategoriOlahragaPage()
    },
  ];

  final List<Map<String, String>> aktivitasList = [
    {'judul': 'Login Berhasil', 'waktu': '2 menit lalu'},
    {'judul': 'Melihat Produk Elektronik', 'waktu': '10 menit lalu'},
    {'judul': 'Menghubungi Kontak', 'waktu': '30 menit lalu'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: const GradientAppBar(title: "Dashboard"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Bagian Atas - Grid Kategori
            const Text(
              "Kategori",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 120,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: kategoriList.length,
              itemBuilder: (context, index) {
                final kategori = kategoriList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadeSlideRoute(page: kategori['page']),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kategori['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(kategori['icon'],
                            color: kategori['color'], size: 42),
                        const SizedBox(height: 8),
                        Text(
                          kategori['nama'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // 🔹 Tombol "Lihat Semua Kategori"
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeSlideRoute(page: KategoriPage()),
                  );
                },
                icon: const Icon(Icons.list_alt, color: Colors.white),
                label: const Text(
                  "Lihat Semua Kategori",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Bagian Tengah - Card Informasi Singkat
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              color: Colors.indigo.shade50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.info_outline,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Selamat datang di Dashboard! Akses cepat ke kategori, profil, dan kontak tersedia di sini.",
                        style: TextStyle(fontSize: 15, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Bagian Bawah - Aktivitas Terakhir
            const Text(
              "Aktivitas Terakhir",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 1,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: aktivitasList.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                  indent: 70,
                ),
                itemBuilder: (context, index) {
                  final aktivitas = aktivitasList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade100,
                      child: const Icon(Icons.history,
                          color: Colors.indigo, size: 22),
                    ),
                    title: Text(
                      aktivitas['judul']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      aktivitas['waktu']!,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),

            // 🔹 Tambahan Tombol Kontak di Akhir
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeSlideRoute(page: KontakPage()),
                  );
                },
                icon: const Icon(Icons.contact_phone, color: Colors.white),
                label: const Text(
                  "Hubungi Kami",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔹 Tombol Profil di pojok bawah kanan
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(context, FadeSlideRoute(page: ProfilPage()));
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
