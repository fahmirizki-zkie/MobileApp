import 'package:dio/dio.dart';
import 'package:test1/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final Dio _dio = Dio();

  /// Mendapatkan daftar mahasiswa aktif
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('DioError: ${e.message}');
    }
  }
}