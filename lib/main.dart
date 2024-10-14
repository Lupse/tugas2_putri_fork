import 'package:flutter/material.dart';
import 'package:tugas2_putri/auth/login.dart';
import 'package:tugas2_putri/menu/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
