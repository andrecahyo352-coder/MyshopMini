import 'package:flutter/material.dart';
import '../widgets/route_fade_slide.dart';
import 'dashboard_page.dart';


class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.call, color: Colors.indigo),
            title: Text('Moch Tengku'),
            subtitle: Text('+62 812 3856 7890'),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.indigo),
            title: Text('Support'),
            subtitle: Text('tengkut9@gmai.com.com'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            FadeSlideRoute(page: DashboardPage()),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
