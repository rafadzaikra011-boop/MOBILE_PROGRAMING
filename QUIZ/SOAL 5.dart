double hitungDiskon(double harga, double persentaseDiskon) {
  double potongan = harga * (persentaseDiskon / 100);
  return harga - potongan;
}

void main() {
  double hargaAwal = 100000;
  double diskon = 20;

  double potongan = hargaAwal * (diskon / 100);
  double totalBayar = hitungDiskon(hargaAwal, diskon);

 


  print('Harga Awal : Rp${hargaAwal.toInt()}');
  print('Diskon     : ${diskon.toInt()}%');
  print('Potongan   : Rp${potongan.toInt()}');
  print('Total Bayar: Rp${totalBayar.toInt()}');
}

