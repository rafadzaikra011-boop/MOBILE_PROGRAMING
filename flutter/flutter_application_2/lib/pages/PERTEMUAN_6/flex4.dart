import 'package:flutter/material.dart';

final List<Map<String, dynamic>> pegawai = [
  {"name": "Nama Lengkap : Mawar", "class": "Kelas : ASE-26001"},
  {"name": "Nama Lengkap : Jamal", "class": "Kelas : ASE-26002"},
  {"name": "Nama Lengkap : Siti", "class": "Kelas : ASE-26003"},
];

class Flex4 extends StatelessWidget {
  const Flex4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      child: Icon(Icons.person, size: 28),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nama Lengkap : Mawar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Kelas : ASE-26001",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
