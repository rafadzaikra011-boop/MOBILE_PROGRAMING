import 'package:flutter/material.dart';

class KeranjangProvider extends ChangeNotifier {
  final List<String> _produk = [];

  //method untuk mendapatkan produk keranjang
  List<String> get produk => List.unmodifiable(_produk);
  //method untuk mendapatkan jumlah item keranjang
  int get jumlahItem => _produk.length;
//method untuk menambahkan produk ke keranjang
  void tambah(String produk) {
    _produk.add(produk);
    notifyListeners();
  }

  //method untuk menghapus produk dari keranjang
  void hapus(String produk) {
    _produk.remove(produk);
    notifyListeners();
  }

  //method untuk mengosongkan keranjang
  void kosongkan() {
    _produk.clear();
    notifyListeners();
  }

}