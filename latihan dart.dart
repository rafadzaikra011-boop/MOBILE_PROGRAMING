// local dan global variable













void menu() {
  List<Map<String, dynamic>> daftarmenu = [
    {"nama": "Nasi Goreng", "harga": 15000},
    {"nama": "Seblak Ceker", "harga": 10000},
    {"nama": "Kwetiau", "harga": 15000},
    {"nama": "Sate maranggi", "harga": 25000},
    {"nama": "mie ayam mercon", "harga": 12000},
  ];
  print("===Pilihan Menu");
  // cetak daftar menu
  daftarmenu.forEach((item) {
    print("->${item['nama']}-${item['harga']}");
  });
}

// hitung total bayar
int totalbayar({int jumlah=0, int harga=0}) {
  return jumlah * harga;
}

void main() {
  menu();
  print(totalbayar(jumlah : 5,harga: 50000));
}
