import 'package:flutter/material.dart';

void main() {
  runApp(const AppCore());
}

class AppCore extends StatelessWidget {
  const AppCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
