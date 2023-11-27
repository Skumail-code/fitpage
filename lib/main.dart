import 'package:flutter/material.dart';
import 'package:tradeswift/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stock Scan Parser',
      home: MyHomePage(title: 'Stock Scan Parser'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 5,
          title: const Text(
            'Stock Scan Parser',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const HomePage());
  }
}
