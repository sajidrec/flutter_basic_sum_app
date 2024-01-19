import 'package:basic_sum_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicSumApp());
}

class BasicSumApp extends StatelessWidget {
  const BasicSumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
