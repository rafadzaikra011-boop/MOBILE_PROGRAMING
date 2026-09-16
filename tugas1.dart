void tampilkanMenu() {
  print('=== MENU KANTIN KAMPUS===');
  print('Nasi Goreng');
  print('ayam geprek');
  print('Es Teh Manis');
}

void tampilkanDataMenu(String nama, int harga) {
  print('=== DATA MENU ===');
  print('Nama : $nama');
  print('Harga :$harga');
}

int hitungTotal(int harga, int jumlah) {
  return harga * jumlah;
}

double hitungDiskon(int total, double persentase) {
  return total * persentase / 100;
}

void tampilkanDetailMenu({
  required String nama,
  required int harga,
  required String kategori,
}) {
  print('=== DAFTAR MENU ===');
  print('Nama = $nama');
  print('Harga = Rp$harga');
  print('Kategori =$kategori');
}

void tampilkanDetailMenuOptimal({
  required String nama,
  int harga = 0,
  required String kategori,
}) {
  print('=== DAFTAR MENU ===');
  print('Nama = $nama');
  print('Harga = Rp$harga');
  print('Kategori =$kategori');
}

class MenuFood {
  String nama;
  int harga;
  String kategori;
  bool tersedia;

  MenuFood(this.nama, this.harga, this.kategori, this.tersedia);

  void tampilkanDetail() {
    print('=== DETAIL MENU ===');
    print('Nama     : $nama');
    print('Harga    : Rp$harga');
    print('Kategori : $kategori');
    print('Tersedia : $tersedia');
  }

  int hitungTotalMenu(int jumlah) {
    return harga * jumlah;
  }
}

class MenuFoodPrivate {
  String nama;
  int _harga;
  String kategori;
  bool tersedia;

  MenuFoodPrivate(this.nama, this._harga, this.kategori, this.tersedia);

  // Getter harga
  int get harga {
    return _harga;
  }

  // Setter harga
  set harga(int nilai) {
    if (nilai >= 0) {
      _harga = nilai;
    } else {
      print('Harga tidak boleh negatif.');
    }
  }

  void tampilkanDetail() {
    print('=== DETAIL MENU ===');
    print('Nama     : $nama');
    print('Harga    : Rp$_harga');
    print('Kategori : $kategori');
    print('Tersedia : $tersedia');
  }
}

abstract class Menu {
  String nama;
  int harga;

  Menu(this.nama, this.harga);

  void tampilkanNama() {
    print('Nama Menu: $nama');
  }

  void tampilkanDetail();

  void tampilkanJenis() {
    print('Jenis Menu');
  }
}

class Food extends Menu {
  Food(String nama, int harga) : super(nama, harga);
  @override
  void tampilkanJenis() {
    print('Makanan');
  }

  @override
  void tampilkanDetail() {
    print('=== DETAIL FOOD ===');
    print('Nama : $nama');
    print('Harga : Rp$harga');
  }
}

class Drink extends Menu {
  Drink(String nama, int harga) : super(nama, harga);

  @override
  void tampilkanJenis() {
    print('Minuman');
  }

  @override
  void tampilkanDetail() {
    print('=== DETAIL DRINK ===');
    print('Nama  : $nama');
    print('Harga :Rp$harga');
  }
}

class OrderItem {
  MenuFood menu;
  int jumlah;

  OrderItem(this.menu, this.jumlah);

  int hitungSubtotal() {
    return menu.harga * jumlah;
  }
}

void sistemKasir() {
  print('');
  print('================================');
  print('         KANTINKAMPUS');
  print('================================');

  // Daftar menu
  List<MenuFood> daftarMenu = [
    MenuFood('Nasi Goreng', 15000, 'Makanan', true),
    MenuFood('Ayam Geprek', 18000, 'Makanan', true),
    MenuFood('Mie Ayam', 12000, 'Makanan', true),
    MenuFood('Soto Ayam', 13000, 'Makanan', true),
    MenuFood('Es Teh Manis', 5000, 'Minuman', true),
  ];

  // Menampilkan daftar menu
  print('');
  print('=== DAFTAR MENU ===');

  for (MenuFood menu in daftarMenu) {
    print('${menu.nama} - Rp${menu.harga} - ${menu.kategori}');
  }

  // Membuat pesanan
  List<OrderItem> pesanan = [
    OrderItem(daftarMenu[0], 2),
    OrderItem(daftarMenu[1], 1),
    OrderItem(daftarMenu[4], 2),
  ];

  // TOTAL HARUS DIDEKLARASIKAN DI SINI
  int total = 0;

  print('');
  print('=== PESANAN ===');

  for (OrderItem item in pesanan) {
    int subtotal = item.hitungSubtotal();

    print('${item.menu.nama} x${item.jumlah} = Rp$subtotal');

    total += subtotal;
  }

  // Menghitung diskon
  double diskon = 0;

  if (total >= 50000) {
    diskon = hitungDiskon(total, 10);
  }

  int totalPembayaran = total - diskon.toInt();

  print('-------------------------------');
  print('Subtotal          Rp$total');
  print('Diskon 10%        Rp${diskon.toInt()}');
  print('-------------------------------');
  print('Total Pembayaran  Rp$totalPembayaran');
  print('================================');
}

int debuggingHitungTotal(int harga, int jumlah) {
  return harga * jumlah;
}

class MenuFoodDebug {
  String nama;
  int harga;

  MenuFoodDebug(this.nama, this.harga);
}

void main() {
  print('');
  print('--- INSTRUKSI 1 ---');

  TampilkanMenu();

  print('');
  print('--- INSTRUKSI 2 ---');

  tampilkanDataMenu('Nasi Goreng', 15000);
  print('');

  tampilkanDataMenu('Ayam Geprek', 18000);

  print('');
  print('--- INSTRUKSI 3 ---');

  int harga = 15000;
  int jumlah = 3;

  int total = hitungTotal(harga, jumlah);

  print('Harga  : Rp$harga');
  print('Jumlah   : $jumlah');
  print('Total   : Rp$total');

   print('');
  print('--- INSTRUKSI 4 ---');

  double diskon = hitungDiskon(50000, 10);

  print('Total        : Rp50000');
  print('Diskon       : 10%');
  print('Nilai Diskon : Rp${diskon.toInt()}');

  print('');
  print('--- INSTRUKSI 5 ---');

  tampilkanDetailMenu(
    nama: 'Nasi Goreng',
    harga: 15000,
    kategori: 'Makanan',
  );

 print('');
  print('--- INSTRUKSI 6 ---');

  // Tanpa harga
  tampilkanDetailMenuOptional(
    nama: 'Es Teh Manis',
    kategori: 'Minuman',
  );

  print('');

  // Dengan harga
  tampilkanDetailMenuOptional(
    nama: 'Es Teh Manis',
    harga: 5000,
    kategori: 'Minuman',
  );

   print('');
  print('--- INSTRUKSI 7 ---');

  var tampilkanNamaMenu = (String nama) {
    print('Menu: $nama');
  };

  tampilkanNamaMenu('Nasi Goreng');

  print('');
  print('--- INSTRUKSI 8 ---');

  var hitungTotalLambda = (int harga, int jumlah) => harga * jumlah;

  int hasilLambda = hitungTotalLambda(12000, 2);

  print('Harga  : Rp12000');
  print('Jumlah : 2');
  print('Total  : Rp$hasilLambda');

   print('');
  print('--- INSTRUKSI 9 ---');

  MenuFood menu1 = MenuFood(
    'Nasi Goreng',
    15000,
    'Makanan',
    true,
  );

  menu1.tampilkanDetail();

print('');
  print('--- INSTRUKSI 10 ---');

  MenuFood menu2 = MenuFood(
    'Ayam Geprek',
    18000,
    'Makanan',
    true,
  );

  MenuFood menu3 = MenuFood(
    'Es Teh Manis',
    5000,
    'Minuman',
    true,
  );

  print('Menu 1 : ${menu1.nama}');
  print('Menu 2 : ${menu2.nama}');
  print('Menu 3 : ${menu3.nama}');

print('');
  print('--- INSTRUKSI 11 ---');

  menu1.tampilkanDetail();


print('');
  print('--- INSTRUKSI 12 ---');

  int totalMenu = menu1.hitungTotalMenu(3);

  print('Harga  : Rp${menu1.harga}');
  print('Jumlah : 3');
  print('Total Pembelian : Rp$totalMenu');

  print('');
  print('--- INSTRUKSI 13 ---');

  List<MenuFood> daftarMenu = [
    MenuFood('Nasi Goreng', 15000, 'Makanan', true),
    MenuFood('Ayam Geprek', 18000, 'Makanan', true),
    MenuFood('Mie Ayam', 12000, 'Makanan', true),
    MenuFood('Soto Ayam', 13000, 'Makanan', true),
    MenuFood('Es Teh Manis', 5000, 'Minuman', true),
  ];

  print('=== DAFTAR MENU ===');

  for (MenuFood menu in daftarMenu) {
    print('${menu.nama} - Rp${menu.harga}');
  }

   print('');
  print('--- INSTRUKSI 14 ---');

  MenuFoodPrivate menuPrivate = MenuFoodPrivate(
    'Nasi Goreng',
    15000,
    'Makanan',
    true,
  );

  print('Nama  : ${menuPrivate.nama}');
  print('Harga : Rp${menuPrivate.harga}');

   print('');
  print('--- INSTRUKSI 15 ---');

  print('Harga awal : Rp${menuPrivate.harga}');

  // Harga valid
  menuPrivate.harga = 20000;

  print('Setelah harga 20000 : Rp${menuPrivate.harga}');

  // Harga tidak valid
  menuPrivate.harga = -5000;

  print('Setelah harga -5000 : Rp${menuPrivate.harga}');

   print('');
  print('--- INSTRUKSI 16 ---');

  Food makanan = Food(
    'Nasi Goreng',
    15000,
  );

  makanan.tampilkanNama();
  makanan.tampilkanJenis();

  print('');
  print('--- INSTRUKSI 17 ---');

  Drink minuman = Drink(
    'Es Teh Manis',
    5000,
  );

  minuman.tampilkanNama();
  minuman.tampilkanJenis();

   print('');
  print('--- INSTRUKSI 18 ---');

  Menu menuFood = Food(
    'Ayam Geprek',
    18000,
  );

  Menu menuDrink = Drink(
    'Es Teh Manis',
    5000,
  );

  menuFood.tampilkanJenis();
  menuDrink.tampilkanJenis();

 print('');
  print('--- INSTRUKSI 19 ---');

  Food foodAbstract = Food(
    'Mie Ayam',
    12000,
  );

  Drink drinkAbstract = Drink(
    'Es Teh Manis',
    5000,
  );

  foodAbstract.tampilkanDetail();
  print('');

  drinkAbstract.tampilkanDetail();

 print('');
  print('--- INSTRUKSI 20 ---');

  print('=== MENU KANTINKAMPUS ===');

  for (int i = 0; i < daftarMenu.length; i++) {
    MenuFood menu = daftarMenu[i];

    print('${i + 1}. ${menu.nama}');
    print('   Rp${menu.harga}');
    print('   ${menu.kategori}');
    print(
      '   ${menu.tersedia ? "Tersedia" : "Tidak Tersedia"}',
    );
    print('');
  }

print('');
  print('--- INSTRUKSI 21 ---');

  OrderItem orderItem = OrderItem(
    daftarMenu[0],
    2,
  );

  print('Menu    : ${orderItem.menu.nama}');
  print('Harga   : Rp${orderItem.menu.harga}');
  print('Jumlah  : ${orderItem.jumlah}');
  print('Subtotal: Rp${orderItem.hitungSubtotal()}');

    print('');
  print('--- INSTRUKSI 22 ---');

  List<OrderItem> daftarPesanan = [
    OrderItem(daftarMenu[0], 2),
    OrderItem(daftarMenu[1], 1),
    OrderItem(daftarMenu[4], 2),
  ];

  int totalPesanan = 0;

  print('=== PESANAN ===');

  for (OrderItem item in daftarPesanan) {
    int subtotal = item.hitungSubtotal();

    print(
      '${item.menu.nama} x${item.jumlah} = Rp$subtotal',
    );

    totalPesanan += subtotal;
  }

  print('------------------------');
  print('Total = Rp$totalPesanan');


print('');
  print('--- INSTRUKSI 23 ---');

  sistemKasir();

   print('');
  print('--- INSTRUKSI 24 ---');

  int hasilDebug = debuggingHitungTotal(
    15000,
    2,
  );

  print('Harga  : Rp15000');
  print('Jumlah : 2');
  print('Hasil  : Rp$hasilDebug');


  print('');
  print('--- INSTRUKSI 25 ---');

  MenuFoodDebug menuDebug = MenuFoodDebug(
    'Nasi Goreng',
    15000,
  );

  print('Nama  : ${menuDebug.nama}');
  print('Harga : Rp${menuDebug.harga}');
}


