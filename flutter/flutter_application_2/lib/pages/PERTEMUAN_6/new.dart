import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              flex: 2,
              child: Container(width: 230, height: 200, color: Colors.blue),
            ),
            Expanded(
              flex: 1,
              child: Container(width: 230, height: 200, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
