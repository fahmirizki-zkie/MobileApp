class ProfileModel {
  final String nama;
  final String nip;
  final String jabatan;
  final String email;

  ProfileModel({
    required this.nama,
    required this.nip,
    required this.jabatan,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      nip: json['nip'] ?? '',
      jabatan: json['jabatan'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'nama': nama, 'nip': nip, 'jabatan': jabatan, 'email': email};
  }
}
