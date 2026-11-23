import 'package:flutter/material.dart';

import '../models/photo.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo #${photo.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              photo.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(photo.url),
            const SizedBox(height: 12),
    
    // Menampilkan foto ukuran penuh dari URL
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0), // Membuat sudut gambar melengkung
              child: Image.network(
                photo.thumbnailUrl,
                width: double.infinity, // Lebar memenuhi layar
                height: 250, // Tinggi gambar (bisa disesuaikan)
                fit: BoxFit.cover, // Memastikan gambar proporsional dan tidak gepeng
                
                // Menampilkan indikator loading saat foto sedang diunduh
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                
                // Menampilkan pesan/ikon jika URL gagal dimuat
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Gagal memuat gambar'),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Ditulis oleh user #${photo.albumId}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}