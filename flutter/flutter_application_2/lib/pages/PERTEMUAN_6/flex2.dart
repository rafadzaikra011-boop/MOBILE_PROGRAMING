import 'package:flutter/material.dart';

class Flex2 extends StatelessWidget {
  const Flex2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Stack(
      children: [
        Container(width: 200, height: 200, color: Colors.blue),
        Positioned(
          top: 20,
          left: 20,
          child: Container(width: 150, height: 150, color: Colors.red),
        ),
      ],
    )));
  }
}
