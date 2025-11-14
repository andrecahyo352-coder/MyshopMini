import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/route_fade_slide.dart';
import 'dashboard_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isEditing = false;
  File? _image;

  // Data profil
  String nama = 'Moch Tengku';
  String nim = '221080200141';
  String prodi = 'Informatika';
  String email = 'tengkut9@gmail.com';
  String telepon = '+62 812 3456 7890';

  final picker = ImagePicker();

  // 🔹 Fungsi untuk ambil foto dari galeri
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // 🔹 Fungsi untuk menyimpan hasil edit
  void _saveProfile() {
    setState(() {
      isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil berhasil diperbarui!'),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4FF),
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.indigo,
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (isEditing) {
                _saveProfile();
              } else {
                setState(() {
                  isEditing = true;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.indigo.shade50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Foto Profil (dapat diganti)
                GestureDetector(
                  onTap: isEditing ? _pickImage : null,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.indigo.shade100,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : const AssetImage('assets/images/profil.png')
                                as ImageProvider,
                      ),
                      if (isEditing)
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.indigo,
                          child: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 18),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Nama
                _buildEditableField(
                  label: 'Nama',
                  value: nama,
                  onChanged: (val) => nama = val,
                ),
                _buildEditableField(
                  label: 'NIM',
                  value: nim,
                  enabled: false,
                ),
                _buildEditableField(
                  label: 'Program Studi',
                  value: prodi,
                  enabled: false,
                ),
                _buildEditableField(
                  label: 'Email',
                  value: email,
                  onChanged: (val) => email = val,
                ),
                _buildEditableField(
                  label: 'Telepon',
                  value: telepon,
                  onChanged: (val) => telepon = val,
                ),
              ],
            ),
          ),
        ),
      ),

      // 🔹 Tombol kembali ke dashboard
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

  // 🔹 Widget field yang bisa diubah
  Widget _buildEditableField({
    required String label,
    required String value,
    bool enabled = true,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        enabled: isEditing && enabled,
        controller: TextEditingController(text: value),
        onChanged: onChanged,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.indigo),
          filled: true,
          fillColor: enabled
              ? Colors.white
              : Colors.grey.shade200, // bidang non-editable berwarna abu
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.indigo),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.indigo, width: 2),
          ),
        ),
      ),
    );
  }
}
