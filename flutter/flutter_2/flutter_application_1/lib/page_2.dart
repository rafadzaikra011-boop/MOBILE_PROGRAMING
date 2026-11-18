import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter/menghitung_provider.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HitungProvider>(
              builder: (context, hitung, child) {
                return Text(
                  hitung.counter.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<HitungProvider>().decrement(),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => context.read<HitungProvider>().increment(),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page3');
              },
              child: const Text("Ke Halaman 3"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text("Ke Katalog dan Keranjang"),
            ),
          ],
        ),
      ),
    );
  }
}
