class MenuFood {
  final String nama;
  final int harga;
  final String kategori;

  MenuFood(this.nama, this.harga, this.kategori);
}

void tampilkanMenuBerdasarkanKategori(
  List<MenuFood> daftarMenu,
  String kategori,
) {
  var nomor = 1;
  for (final menu in daftarMenu) {
    if (menu.kategori == kategori) {
      print('$nomor. ${menu.nama} - Rp${menu.harga}');
      nomor++;
    }
  }
}

void main() {
  final daftarMenu = <MenuFood>[
    MenuFood('Nasi Goreng', 15000, 'Makanan'),
    MenuFood('Mie Ayam', 12000, 'Makanan'),
    MenuFood('Ayam Geprek', 18000, 'Makanan'),
    MenuFood('Soto Ayam', 14000, 'Makanan'),
    MenuFood('Es Teh', 5000, 'Minuman'),
  ];

  print('=== MENU MAKANAN ===\n');
  tampilkanMenuBerdasarkanKategori(daftarMenu, 'Makanan');

  print('\n=== MENU MINUMAN ===\n');
  tampilkanMenuBerdasarkanKategori(daftarMenu, 'Minuman');
}