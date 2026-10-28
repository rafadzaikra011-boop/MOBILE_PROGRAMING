import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/PERTEMUAN_6/imahApp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImahApp(),
    );
  }
}

void main(List<String> args) {
  runApp(const MyApp());
}
