import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeranjangProvider extends ChangeNotifier {
  final Map<String, int> _jumlahProduk = {};

  Map<String, int> get jumlahProduk =>
      Map<String, int>.unmodifiable(_jumlahProduk);

  int get jumlahItem =>
      _jumlahProduk.values.fold(0, (total, jumlah) => total + jumlah);

  void tambah(String produk) {
    _jumlahProduk.update(
      produk,
      (jumlah) => jumlah + 1,
      ifAbsent: () => 1,
    );
    notifyListeners();
  }

  void kurangi(String produk) {
    final jumlah = _jumlahProduk[produk];
    if (jumlah == null) return;

    if (jumlah <= 1) {
      _jumlahProduk.remove(produk);
    } else {
      _jumlahProduk[produk] = jumlah - 1;
    }
    notifyListeners();
  }

  void hapus(String produk) {
    if (_jumlahProduk.remove(produk) != null) {
      notifyListeners();
    }
  }

  void kosongkan() {
    if (_jumlahProduk.isEmpty) return;
    _jumlahProduk.clear();
    notifyListeners();
  }
}

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Keranjang'),
        actions: [
          Consumer<KeranjangProvider>(
            builder: (context, keranjang, child) {
              if (keranjang.jumlahItem == 0) {
                return const SizedBox.shrink();
              }
              return TextButton(
                onPressed: keranjang.kosongkan,
                child: const Text('Kosongkan'),
              );
            },
          ),
        ],
      ),
      body: Consumer<KeranjangProvider>(
        builder: (context, keranjang, child) {
          final produkList = keranjang.jumlahProduk.keys.toList();

          if (produkList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text('Keranjang masih kosong'),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: produkList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final produk = produkList[index];
              final jumlah = keranjang.jumlahProduk[produk] ?? 0;

              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(produk),
                subtitle: Text('Jumlah: $jumlah'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'Kurangi',
                      onPressed: () => keranjang.kurangi(produk),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(jumlah.toString()),
                    IconButton(
                      tooltip: 'Tambah',
                      onPressed: () => keranjang.tambah(produk),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    IconButton(
                      tooltip: 'Hapus',
                      onPressed: () => keranjang.hapus(produk),
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
