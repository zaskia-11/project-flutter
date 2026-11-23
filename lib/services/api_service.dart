import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../models/photo.dart';
import '../constants/api_constants.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final url =Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}',
    );

    try {
      // minta data (makksimal tunggu 10 detik)
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      
      // cek apakah berhasil (200 = ok)
      if (response.statusCode == 200) {
       // ubah teks json menjadi list 
        final List data = jsonDecode(response.body);

        //bungkus tiap item mnjadi objek post
        return data.map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception('Gagal memuat data:(kode: ${response.statusCode})');
      }
    } on TimeoutException{
      throw Exception('Koneksi terlalu lama. coba lagi');
    }
  }
  
}

class ApiPhotoService {
  Future<List<Photo>> fetchPhotos() async {
    final url =Uri.parse(
      '${ApiPhotosConstants.baseUrl}${ApiPhotosConstants.photosEndpoint}',
    );

    try {
      // minta data (makksimal tunggu 10 detik)
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      
      // cek apakah berhasil (200 = ok)
      if (response.statusCode == 200) {
       // ubah teks json menjadi list 
        final List data = jsonDecode(response.body);

        //bungkus tiap item mnjadi objek photo
        return data.map((e) => Photo.fromJson(e)).toList();
      } else {
        throw Exception('Gagal memuat data:(kode: ${response.statusCode})');
      }
    } on TimeoutException{
      throw Exception('Koneksi terlalu lama. coba lagi');
    }
  }
  
}
