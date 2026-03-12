import 'dart:io';

void main() {
  Map<String, String> data = {
    'Anang' : '081234567890',
    'Arman' : '082345678901',
    'Doni' : '083456789012',
  };
  print('Data: $data');
  
  // Menambahkan Data dalam Map
  data['Rio'] = '084567890123';
  print('Data Setelah ditambahkan: $data');

  // Tampilkan Data dengan Key Tertentu
  print('Nomor Anang: ${data['Anang']}');

    // Mengubah Data pada Key Tertentu
  stdout.write('Masukkan nama untuk diubah: ');
  String ubahKey = stdin.readLineSync()!;

  if (data.containsKey(ubahKey)) {
    stdout.write('Masukkan nomor baru untuk $ubahKey: ');
    String nomorBaru = stdin.readLineSync()!;
    data[ubahKey] = nomorBaru;
    print('Data Setelah diubah: $data');
  } else {
    print('Nama $ubahKey tidak ditemukan dalam data.');
  }

  // Hapus Data dengan Key Tertentu
  stdout.write('Masukkan nama untuk dihapus: ');
  String hapusKey = stdin.readLineSync()!;
  if (data.containsKey(hapusKey)) {
    data.remove(hapusKey);
    print('Data Setelah dihapus: $data');
  } else {
    print('Nama $hapusKey tidak ditemukan dalam data.');
  }

  // Cek Data dengan Key Tertentu
  stdout.write('Masukkan nama untuk dicek: ');
  String cekKey = stdin.readLineSync()!;
  if (data.containsKey(cekKey)) {
    print('Nama $cekKey ada dalam data dengan nomor ${data[cekKey]}.');
  } else {
    print('Nama $cekKey tidak ada dalam data.');
  }

  // Hitung Jumlah Data dalam Map
  print('Jumlah Data: ${data.length}');

  // Tampilkan Semua key
  print('=== SEMUA KEY ===');
  for (var key in data.keys) {
    print(key);
  }

  // Tampilkan Semua value
  print('=== SEMUA VALUE ===');
  for (var value in data.values) {
    print(value);
  }

}