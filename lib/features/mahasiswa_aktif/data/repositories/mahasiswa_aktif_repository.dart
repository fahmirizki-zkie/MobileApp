import 'package:test1/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  /// Mendapatkan daftar mahasiswa aktif
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa aktif
    return [
      MahasiswaAktifModel(
        nama: 'Dewi Lestari',
        nim: '2022001',
        email: 'dewi.lestari@example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaAktifModel(
        nama: 'Rizky Pratama',
        nim: '2022002',
        email: 'rizky.pratama@example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaAktifModel(
        nama: 'Nur Hidayah',
        nim: '2022003',
        email: 'nur.hidayah@example.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}
