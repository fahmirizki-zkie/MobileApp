import 'dart:io';

void main() {
    Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
    print('Set Burung: $burung');

    // Menambahkan Data dalam Set
    burung.add('Nuri');
    print('Set Burung Setelah ditambahkan: $burung');

    // Menambahkan Data Duplicate dalam Set
    burung.add('Nuri');
    print('Set Burung Setelah ditambahkan Data Duplicate: $burung');

    // Menghapus Data dalam Set
    burung.remove('Nuri');
    print('Set Burung Setelah dihapus: $burung');

    // Cek Data tertentu apakah ada dalam Set
    stdout.write('Masukkan nama burung untuk dicek: ');
    String cekBurung = stdin.readLineSync()!;
    if (burung.contains(cekBurung)) {
        print('Burung $cekBurung ada dalam Set Burung.');
    } else {
        print('Burung $cekBurung tidak ada dalam Set Burung.');
    }

    // Hitung Jumlah Data dalam Set
    print('Jumlah Burung dalam Set: ${burung.length}');

    // List Data dalam Set
    print('=== SEMUA DATA ===');
    int no = 1;
    for (var item in burung) {
        print('$no. $item');
        no++;
    }
}