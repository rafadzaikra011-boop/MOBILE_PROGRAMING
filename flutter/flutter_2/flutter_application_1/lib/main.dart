import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter/menghitung_provider.dart';
import 'page_2.dart';
import 'page_3.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HitungProvider(),
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
        '/': (context) => const Page2(),
        '/page3': (context) => const Page3(),
      },
      initialRoute: '/',
    );
  }
}
