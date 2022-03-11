import 'package:flutter/material.dart';
import 'package:santapp/home_screen.dart';

void main(){
  runApp(const SantaApp());
}

class SantaApp extends StatelessWidget {
  const SantaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

