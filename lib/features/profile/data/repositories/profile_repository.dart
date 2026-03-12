import 'package:test1/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  /// Mendapatkan data profile
  Future<List<ProfileModel>> getProfileList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy profile
    return [
      ProfileModel(
        nama: 'Admin D4TI',
        nip: '198001012010011001',
        jabatan: 'Ketua Program Studi',
        email: 'admin.d4ti@example.com',
      ),
    ];
  }
}
