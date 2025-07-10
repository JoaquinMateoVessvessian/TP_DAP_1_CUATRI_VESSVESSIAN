import 'package:flutter/material.dart';
import 'package:veintidosdelcinco/entities/product.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  List<Product> products = [
    Product(name: 'IPONE 1', price: 10),
    Product(name: 'SASONE 2', price: 100),
    Product(name: 'TZIAOM 3', price: 20),
    Product(name: 'GUGUL 4', price: 0),
    Product(name: 'ROJOYO 5', price: 30),
  ];

  @override
  void initState() {
    super.initState();
    for (var product in products) {
      if (product.isFree()) {
        print('${product.name} es gratis');
      } else {
        print('${product.name} vale ${product.price}');
      }
    }
    var iphone = products.firstWhere(
      (product) => product.name == 'IPONE',
    );
    print (iphone);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
