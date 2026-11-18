import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resto_provider.dart';

class NotaPesananPage extends StatelessWidget {
  const NotaPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Pesanan'),
        actions: [
          Consumer<RestoProvider>(
            builder: (context, resto, child) {
              if (resto.kosong) return const SizedBox.shrink();
              return TextButton(
                onPressed: () {
                  context.read<RestoProvider>().KosongkanPesanan();
                },
                child: const Text('Reset'),
              );
            },
          ),
        ],
      ),
      body: Consumer<RestoProvider>(
        builder: (context, resto, child) {
          if (resto.kosong) {
            return const Center(
              child: Text(
                'Belum ada pesanan yang dipilih',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: resto.pesanan.length,
                    itemBuilder: (context, index) {
                      final pesanan = resto.pesanan[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          title: Text('Menu ID: ${pesanan.id}'),
                          subtitle: Text(
                            'Jumlah: ${pesanan.jumlah} x Rp ${pesanan.harga} = Rp ${pesanan.subtotal}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              context
                                  .read<RestoProvider>()
                                  .hapusItemPesanan(pesanan.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    border: Border(
                      top: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Bayar:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp ${resto.totalBayar}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}
