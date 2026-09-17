

void main() {
  String namaProduk = "Nasi Goreng";
  int harga = 15000;
  int jumlahBeli = 3;
  double pajak = 0.10;

  int subtotal = harga * jumlahBeli;

  double jumlahPajak = subtotal * pajak;

  double totalBayar = subtotal + jumlahPajak;

 print("Nama Produk : $namaProduk");
  print("Harga       : Rp$harga");
  print("Jumlah Beli : $jumlahBeli");
  print("Subtotal    : Rp$subtotal");
  print("Pajak 10%   : Rp${jumlahPajak.toInt()}");
  print("Total Bayar : Rp${totalBayar.toInt()}");
}
