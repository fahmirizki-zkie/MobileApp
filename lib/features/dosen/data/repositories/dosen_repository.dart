import 'package:dio/dio.dart';
import 'package:test1/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  final Dio _dio = Dio();

  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data dosen: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('DioError: ${e.message}');
    }
  }
}