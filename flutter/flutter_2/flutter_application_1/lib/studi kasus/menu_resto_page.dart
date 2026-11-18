import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resto_provider.dart';

class MenuRestoPage extends StatelessWidget {
  const MenuRestoPage({super.key});

  static const List<Map<String, String>> dummyMenuResto = [
    {
      'id': 'M01',
      'nama': 'Nasi Goreng Spesial',
      'harga': '25000',
      'stok': '15',
      'gambar':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300',
    },
    {
      'id': 'M02',
      'nama': 'Mie Ayam Jamur Bakso',
      'harga': '20000',
      'stok': '20',
      'gambar':
          'https://images.unsplash.com/photo-1612927601601-6638404737ce?w=300',
    },
    {
      'id': 'M03',
      'nama': 'Ayam Geprek Sambal Matah',
      'harga': '22000',
      'stok': '8',
      'gambar':
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=300',
    },
    {
      'id': 'M04',
      'nama': 'Es Kopi Susu Aren',
      'harga': '15000',
      'stok': '30',
      'gambar':
          'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=300',
    },
    {
      'id': 'M05',
      'nama': 'Es Lemon Tea Segar',
      'harga': '8000',
      'stok': '40',
      'gambar':
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=300',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resto Kampus'),
        actions: [
          Consumer<RestoProvider>(
            builder: (context, resto, child) {
              return IconButton(
                tooltip: 'Lihat Nota Pesanan',
                onPressed: () {
                  Navigator.pushNamed(context, '/pesanan-resto');
                },
                icon: Badge(
                  isLabelVisible: resto.jumlahItem > 0,
                  label: Text(resto.jumlahItem.toString()),
                  child: const Icon(Icons.receipt_long_outlined),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyMenuResto.length,
        itemBuilder: (context, index) {
          final item = dummyMenuResto[index];
          final harga = int.parse(item['harga']!);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['gambar']!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.fastfood, size: 36),
                ),
              ),
              title: Text(
                item['nama']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Rp $harga | Stok: ${item['stok']}'),
              trailing: FilledButton.tonal(
                onPressed: () {
                  context.read<RestoProvider>().tambahPesanan(
                    id: item['id']!,
                    harga: harga,
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          '${item['nama']} ditambahkan ke pesanan',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                },
                child: const Text('Pesan'),
              ),
            ),
          );
        },
      ),
    );
  }
}
