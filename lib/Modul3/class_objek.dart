import 'dart:io';

class mahasiswa {
  String nama = "Fahmi";

  void tampilkanData() {
    print ("Nama Mahasiswa: $nama");
  }
}

  void main() {
    var mahasiswa1 = mahasiswa();
    mahasiswa1.tampilkanData();

    stdout.write("Masukkan nama baru: ");
    String? namaBaru = stdin.readLineSync();
    if (namaBaru != null && namaBaru.isNotEmpty) {
      mahasiswa1.nama = namaBaru;
      print('Nama berhasil diubah!');
      mahasiswa1.tampilkanData();
    } else {  
      print('Nama tidak boleh kosong. Data tidak diubah.');
    }
  }

  