import 'package:flutter/material.dart';
import 'selector_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App Figma',
      theme: ThemeData(
        fontFamily: 'Montserrat', 
        useMaterial3: true,
      ),
      home: const SelectorScreen(), // Cambiado para mostrar selector primero
    );
  }
}