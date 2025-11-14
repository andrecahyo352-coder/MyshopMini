import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Elegan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: DashboardPage(),
    );
  }
}
