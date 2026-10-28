import 'package:flutter/material.dart';

class Flex3 extends StatelessWidget {
  const Flex3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: 300,
            height: 200,
            color: Colors.blue,
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.yellow,
          ),
          Container(
            width: 300,
            height: 200,
            color: const Color.fromARGB(255, 116, 25, 94),
          ),
        ],
      ),
    );
  }
}
