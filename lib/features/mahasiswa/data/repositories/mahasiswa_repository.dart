import 'package:dio/dio.dart';
import 'package:test1/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio _dio = Dio();

  /// Mendapatkan daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug
        return data.map((json) => MahasiswaModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('DioError: ${e.message}');
    }
  }
}