import 'package:flutter/material.dart';

class OutputEskulScreen extends StatelessWidget {
  final String nama;
  final String telp;
  final String email;
  final String kelas;
  final List<String> eskul; 
  final String tglDaftar;

  const OutputEskulScreen({
    super.key,
    required this.nama,
    required this.telp,
    required this.email,
    required this.kelas,
    required this.eskul,
    required this.tglDaftar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Pendaftaran Eskul"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Data Pendaftaran Berhasil",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(height: 30, thickness: 1),
                    _buildItem("Nama Lengkap", nama),
                    _buildItem("No Telepon", telp),
                    _buildItem("Email", email),
                    _buildItem("Kelas", kelas),
                    // Menampilkan list eskul menggunakan join agar menjadi satu string yang dipisahkan koma
                    _buildItem("Eskul Pilihan", eskul.join(", ")),
                    _buildItem("Tanggal Daftar", tglDaftar),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Kembali ke halaman form
                        },
                        child: const Text(
                          "Kembali",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(": "),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}