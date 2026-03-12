import 'dart:io';

// CLASS PARENT
class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print('Nama Mahasiswa: ${nama ?? 'Belum diisi'}');
    print('NIM: ${nim ?? 'Belum diisi'}');
    print('Jurusan: ${jurusan ?? 'Belum diisi'}');
  }
}

// EXTENDS
class MahasiswaAktif extends Mahasiswa {
  String status = "Aktif";

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Status: $status");
  }
}

class MahasiswaAlumni extends Mahasiswa {
  String status = "Alumni";

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Status: $status");
  }
}

// MIXIN
mixin BisaBelajar {
  void belajar() {
    print("Sedang belajar");
  }
}

mixin BisaMengajar {
  void mengajar() {
    print("Sedang mengajar");
  }
}

mixin BisaMeneliti {
  void meneliti() {
    print("Sedang meneliti");
  }
}

// CLASS DENGAN MIXIN
class MahasiswaMixin with BisaBelajar {
  String? nama;
  int? nim;
  String? jurusan;
  String? status;

  void tampilkanData() {
    print("Nama: $nama");
    print("NIM: $nim");
    print("Jurusan: $jurusan");
    print("Status: $status");
  }

  void ambilKRS() {
    print("Mahasiswa sedang mengambil KRS");
  }
}

class Dosen with BisaMengajar, BisaMeneliti {
  String? nama;
  String? nip;
  String? mataKuliah;

  void tampilkanData() {
    print("Nama Dosen: $nama");
    print("NIP: $nip");
    print("Mengajar: $mataKuliah");
  }

  void bimbingMahasiswa() {
    print("Dosen sedang membimbing mahasiswa");
  }
}

class Fakultas with BisaMeneliti {
  String? namaFakultas;
  String? dekan;

  void tampilkanInfo() {
    print("Fakultas: $namaFakultas");
    print("Dekan: $dekan");
  }
}

void main() {

  // INPUT DATA MAHASISWA
  Mahasiswa mahasiswa = Mahasiswa();

  print('Masukkan Nama mahasiswa:');
  mahasiswa.nama = stdin.readLineSync();

  print('Masukkan NIM mahasiswa:');
  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');

  print('Masukkan Jurusan mahasiswa:');
  mahasiswa.jurusan = stdin.readLineSync();

  print("\n=== Data Mahasiswa ===");
  mahasiswa.tampilkanData();

  // TESTING EXTENDS
  print("\n=== Testing Extends ===");

  MahasiswaAktif aktif = MahasiswaAktif();
  aktif.nama = mahasiswa.nama;
  aktif.nim = mahasiswa.nim;
  aktif.jurusan = mahasiswa.jurusan;

  aktif.tampilkanData();

  print("");

  MahasiswaAlumni alumni = MahasiswaAlumni();
  alumni.nama = mahasiswa.nama;
  alumni.nim = mahasiswa.nim;
  alumni.jurusan = mahasiswa.jurusan;

  alumni.tampilkanData();

  // TESTING MIXIN MAHASISWA
  print("\n=== Testing Mixin Mahasiswa ===");

  MahasiswaMixin mhs = MahasiswaMixin();
  mhs.nama = "Fahmi";
  mhs.nim = 12345;
  mhs.jurusan = "Informatika";
  mhs.status = "Aktif";

  mhs.tampilkanData();
  mhs.belajar();

  // TESTING MIXIN DOSEN
  print("\n=== Testing Mixin Dosen ===");

  Dosen dosen = Dosen();
  dosen.nama = "Pak Budi";
  dosen.nip = "198765";
  dosen.mataKuliah = "Pemrograman Mobile";

  dosen.tampilkanData();
  dosen.mengajar();
  dosen.meneliti();

  // TESTING MIXIN FAKULTAS
  print("\n=== Testing Mixin Fakultas ===");

  Fakultas fakultas = Fakultas();
  fakultas.namaFakultas = "Teknik";
  fakultas.dekan = "Dr. Andi";

  fakultas.tampilkanInfo();
  fakultas.meneliti();
}
