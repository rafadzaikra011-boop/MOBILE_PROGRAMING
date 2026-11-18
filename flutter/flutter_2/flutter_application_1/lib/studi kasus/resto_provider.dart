import 'package:flutter/foundation.dart';

class PesananResto {
  const PesananResto({
    required this.id,
    required this.jumlah,
    required this.harga,
  });

  final String id;
  final int jumlah;
  final int harga;

  int get subtotal => jumlah * harga;
}

class RestoProvider extends ChangeNotifier {
  final Map<String, PesananResto> _pesanan = {};

  List<PesananResto> get pesanan =>
      List<PesananResto>.unmodifiable(_pesanan.values);

  bool get kosong => _pesanan.isEmpty;

  int get jumlahItem =>
      _pesanan.values.fold(0, (total, item) => total + item.jumlah);

  int get totalBayar =>
      _pesanan.values.fold(0, (total, item) => total + item.subtotal);

  void tambahPesanan({
    required String id,
    required int harga,
    int jumlah = 1,
  }) {
    if (jumlah < 1 || harga < 0) return;

    final pesananSaatIni = _pesanan[id];
    _pesanan[id] = PesananResto(
      id: id,
      harga: harga,
      jumlah: (pesananSaatIni?.jumlah ?? 0) + jumlah,
    );
    notifyListeners();
  }

  void kurangiPesanan(String id) {
    final pesanan = _pesanan[id];
    if (pesanan == null) return;

    if (pesanan.jumlah <= 1) {
      _pesanan.remove(id);
    } else {
      _pesanan[id] = PesananResto(
        id: id,
        harga: pesanan.harga,
        jumlah: pesanan.jumlah - 1,
      );
    }
    notifyListeners();
  }

  void hapusPesanan(String id) {
    if (_pesanan.remove(id) != null) {
      notifyListeners();
    }
  }

  void hapusItemPesanan(String id) {
    hapusPesanan(id);
  }

  void reset() {
    if (_pesanan.isEmpty) return;
    _pesanan.clear();
    notifyListeners();
  }

  void KosongkanPesanan() {
    reset();
  }
}
