class MenuFood {
  String nama;
  int harga;
  bool tersedia;
  MenuFood({required this.nama, required this.harga, required this.tersedia});

  void tampilkanInfo() {
    print('=== MENU FOOD ===');
    print('Nama : $nama');
    print('Harga : Rp$harga');
    print('Tersedia : ${tersedia ? 'Ya' : 'Tidak'}');
  }
}

void main() {
  MenuFood menu1 = MenuFood(nama: 'Nasi Goreng', harga: 15000, tersedia: true);

  menu1.tampilkanInfo();
}
