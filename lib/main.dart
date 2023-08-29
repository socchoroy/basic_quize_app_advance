import 'package:flutter/material.dart';
import 'package:basic_quize_app_practice/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quize App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(127, 187, 45, 38),
            ),
          ),
          centerTitle: true,
          elevation: 0, //Remove App Bar Shadow

          backgroundColor: Colors.transparent,
        ),
        body: const StartScreen(),
      ),
    ),
  );
}
