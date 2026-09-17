class Produk {
  final String nama;
  final int harga;

  Produk(this.nama, this.harga);
}

class Pesanan {
  final Produk produk;
  final int jumlah;

  Pesanan(this.produk, this.jumlah);

  int hitungSubtotal() => produk.harga * jumlah;
}

int hitungSubtotal(List<Pesanan> daftarPesanan) {
  var subtotal = 0;
  for (final pesanan in daftarPesanan) {
    subtotal += pesanan.hitungSubtotal();
  }
  return subtotal;
}

int hitungDiskon(int subtotal, int persentaseDiskon) {
  if (persentaseDiskon > 0) {
    return subtotal * persentaseDiskon ~/ 100;
  }
  return 0;
}

void tampilkanPesanan(List<Pesanan> daftarPesanan) {
  for (final pesanan in daftarPesanan) {
    print(
      '${pesanan.produk.nama} x${pesanan.jumlah} = '
      'Rp${pesanan.hitungSubtotal()}',
    );
  }
}

void main() {
  const namaPelanggan = 'Siti';
  const persentaseDiskon = 10;

  final nasiGoreng = Produk('Nasi Goreng', 15000);
  final ayamGeprek = Produk('Ayam Geprek', 18000);
  final esTeh = Produk('Es Teh', 5000);

  final daftarPesanan = <Pesanan>[
    Pesanan(nasiGoreng, 1),
    Pesanan(ayamGeprek, 1),
    Pesanan(esTeh, 2),
  ];

  final subtotal = hitungSubtotal(daftarPesanan);
  final diskon = hitungDiskon(subtotal, persentaseDiskon);
  final totalBayar = subtotal - diskon;

  print('=== KASIR KANTINKAMPUS ===\n');
  print('Pelanggan : $namaPelanggan\n');
  tampilkanPesanan(daftarPesanan);
  print('\nSubtotal       = Rp$subtotal');
  print('Diskon $persentaseDiskon%     = Rp$diskon');
  print('Total Bayar    = Rp$totalBayar');
}