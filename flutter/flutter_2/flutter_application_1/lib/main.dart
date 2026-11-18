import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter/menghitung_provider.dart';
import 'page_2.dart';
import 'page_3.dart';
import 'studi kasus/katalog_page.dart';
import 'studi kasus/keranjang_page.dart';
import 'studi kasus/menu_resto_page.dart';
import 'studi kasus/nota_pesanan_page.dart';
import 'studi kasus/resto_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HitungProvider()),
        ChangeNotifierProvider(create: (context) => KeranjangProvider()),
        ChangeNotifierProvider(create: (context) => RestoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const KatalogPage(),
        '/menu-resto': (context) => const MenuRestoPage(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
        '/keranjang': (context) => const KeranjangPage(),
        '/nota-pesanan': (context) => const NotaPesananPage(),
        '/pesanan-resto': (context) => const NotaPesananPage(),
      },
      initialRoute: '/menu-resto',
    );
  }
}
