import 'package:test1/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa
    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '2021001',
        email: 'budi.santoso@example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Siti Rahayu',
        nim: '2021002',
        email: 'siti.rahayu@example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Ahmad Fauzi',
        nim: '2021003',
        email: 'ahmad.fauzi@example.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}
