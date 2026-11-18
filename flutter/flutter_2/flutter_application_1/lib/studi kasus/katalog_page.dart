import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'keranjang_page.dart';

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  static const List<String> _daftarProduk = [
    'Buku Flutter Dasar',
    'Kopi Susu Kampus',
    'Mouse Wireless',
    'Sticky Notes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh 2: Katalog'),
        actions: [
          Consumer<KeranjangProvider>(  
            builder: (context, keranjang, child) {
              return IconButton(
                key: const Key('open_keranjang_button'),
                tooltip: 'Lihat Keranjang',
                onPressed: () {
                  Navigator.pushNamed(context, '/keranjang');
                },
                icon: Badge(
                  isLabelVisible: keranjang.jumlahItem > 0,
                  label: Text(keranjang.jumlahItem.toString()),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'Tambah produk di halaman ini, lalu buka ikon keranjang di kanan atas.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _daftarProduk.length,
              itemBuilder: (context, index) {
                final produk = _daftarProduk[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(produk),
                    trailing: FilledButton.tonal(
                      onPressed: () {
                        context.read<KeranjangProvider>().tambah(produk);
                       
                        final messenger = ScaffoldMessenger.of(context);
                        messenger.hideCurrentSnackBar();
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text('$produk ditambahkan ke keranjang'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: const Text('+ Tambah'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
