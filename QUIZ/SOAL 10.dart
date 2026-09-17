
class MenuFood {
  final String nama;
  final int harga;
  final bool tersedia;

  MenuFood(this.nama, this.harga, this.tersedia);

  String status() => tersedia ? 'Tersedia' : 'Tidak tersedia';
}

void tampilkanMenu(List<MenuFood> daftarMenu) {
  for (var i = 0; i < daftarMenu.length; i++) {
    final menu = daftarMenu[i];
    print('${i + 1}. ${menu.nama} - Rp${menu.harga} - ${menu.status()}');
  }
}

void tampilkanMenuTersedia(List<MenuFood> daftarMenu) {
  var nomor = 1;
  for (final menu in daftarMenu) {
    if (menu.tersedia) {
      print('$nomor. ${menu.nama} - Rp${menu.harga} - ${menu.status()}');
      nomor++;
    }
  }
}

int hitungTotal(List<MenuFood> daftarMenu, Map<String, int> pesanan) {
  var total = 0;
  for (final menu in daftarMenu) {
    final jumlah = pesanan[menu.nama] ?? 0;
    total += menu.harga * jumlah;
  }
  return total;
}

void tampilkanPesanan(
  List<MenuFood> daftarMenu,
  Map<String, int> pesanan,
) {
  for (final menu in daftarMenu) {
    final jumlah = pesanan[menu.nama] ?? 0;
    if (jumlah > 0) {
      print('${menu.nama} x$jumlah = Rp${menu.harga * jumlah}');
    }
  }
}

void main() {
  final daftarMenu = <MenuFood>[
    MenuFood('Nasi Goreng', 15000, true),
    MenuFood('Mie Ayam', 12000, true),
    MenuFood('Ayam Geprek', 18000, true),
    MenuFood('Soto Ayam', 14000, false),
    MenuFood('Es Teh', 5000, true),
  ];

  final pesanan = <String, int>{
    'Nasi Goreng': 2,
    'Es Teh': 2,
  };

  print('=== KANTINKAMPUS ===');
  print('\nDAFTAR MENU:\n');
  tampilkanMenuTersedia(daftarMenu);

  print('\n=== PESANAN ===\n');
  tampilkanPesanan(daftarMenu, pesanan);
  print('\nTotal Bayar    = Rp${hitungTotal(daftarMenu, pesanan)}');
}
