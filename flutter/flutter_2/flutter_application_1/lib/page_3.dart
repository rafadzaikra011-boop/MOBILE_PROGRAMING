import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter/menghitung_provider.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const Text("Ini data dari page 2"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali ke Halaman 2"),
            ),
          ],
        ),
      ),
    );
  }
}
