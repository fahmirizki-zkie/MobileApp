import 'dart:io';

void main() {
  // Single Line Map
  print ('=== INPUT DATA MAHASISWA ===');
  stdout.write('Masukkan NIM : ');
  String nim = stdin.readLineSync()!;

  stdout.write('Masukkan Nama : ');
  String nama = stdin.readLineSync()!;

  stdout.write('Masukkan Jurusan : ');
  String jurusan = stdin.readLineSync()!;

  stdout.write('Masukkan IPK : ');
  String ipk = stdin.readLineSync()!;

  Map<String, String> dataMahasiswa = {
    'NIM' : nim,
    'Nama' : nama,  
    'Jurusan' : jurusan,
    'IPK' : ipk,
  };

  print('Data Mahasiswa: $dataMahasiswa');


  print(' ==== Input Multiple Data Mahasiswa ====');
  List<Map<String, String>> listMahasiswa = [];
  for (int i = 0; i < 3; i++) {
    print('\n--- Mahasiswa ke-${i + 1} ---');
    stdout.write('Masukkan NIM : ');
    String nim = stdin.readLineSync()!;

    stdout.write('Masukkan Nama : ');
    String nama = stdin.readLineSync()!;

    stdout.write('Masukkan Jurusan : ');
    String jurusan = stdin.readLineSync()!;

    stdout.write('Masukkan IPK : ');
    String ipk = stdin.readLineSync()!;

    Map<String, String> dataMahasiswa = {
      'NIM' : nim,
      'Nama' : nama,  
      'Jurusan' : jurusan,
      'IPK' : ipk,
    };

    listMahasiswa.add(dataMahasiswa);
  }

  print('==== Data Mahasiswa ====');
  for (var mahasiswa in listMahasiswa) {
    print(mahasiswa);
  }

}