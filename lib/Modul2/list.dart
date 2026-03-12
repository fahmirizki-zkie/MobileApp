import 'dart:io';

void main() {
  List<String> names = ['Alfa', 'Beta', 'Charlie'];
  print('Names: $names');

  // Menambahkan Data dalam List
  names.add('Delta');
  print('Names Setelah ditambahkan: $names');

  // Menambahkan Data index tertentu
  print('Elemen Pertama: ${names[0]}');
  print('Elemen Kedua: ${names[1]}');

  //  Mengubah Data Pada Index Tertentu 
  names[1] = 'Bravo';
  print('Names Setelah diubah: $names');

  //  Hapus Data Tertentu
  names.remove('Charlie');
  print('Names Setelah dihapus: $names');

  // Hitung Jumlah Data 
  print('Jumlah Nama: ${names.length}');

  // Looping Data List
  print('Menampilkan Setiap Elemen : ');
  for (String name in names) {
    print(name);
  }
  
  //Mmebuat List Kosong
  //List<String> datalist = [];
  //print('Data list Kosong : $datalist');

  // Mengambil Jumlah Data Dari Pengguna
  //int count = 0;
  //while (count <= 0) {
      //stdout.write('Masukkan Jumlah List : ');
      //String? input = stdin.readLineSync();
        //try {
          //count = int.parse(input!);
            //if (count <= 0) {
            //print('Masukkan angka lebih dari 0!');
        //}
    
      //} catch (e) {
        //print('Input tidak valid. Masukkan angka yang benar.');
      //}
    //}
    
    // Memasukkan Data ke dalam list menggunakan for loop
    //for (int i = 0; i< count; i++)  {
      //stdout.write('data ke-${i+1} :');
      //String? data = stdin.readLineSync()!;
      //datalist.add(data);
    //}

  // Menampilkan Data List
  //print('Data List :');
  //print(datalist);

  // List Data
  print('== SEMUA DATA ==');
  List<String> alphabet = ['a', 'b', 'c', 'd', 'e'];
  print('alphabet: $alphabet');

  // Tampil Berdasarkan Index Tertentu 
  ('index 0: ${alphabet[0]}');
  ('index 1: ${alphabet[1]}');
  ('index 2: ${alphabet[2]}');
  ('index 3: ${alphabet[3]}');
  ('index 4: ${alphabet[4]}');

  //  Mengubah Data Pada Index Tertentu 
  alphabet[3] = 'f';

  //  Hapus Data Tertentu
  alphabet.remove('e');
  
  print('== SEMUA DATA ==');
  // Looping Data list 
  for (int i = 0 ; i < alphabet.length; i++) {
    print('Index $i: ${alphabet[i]}');
  }

  
  }
  




