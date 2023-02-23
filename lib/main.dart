import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'model/cart.dart';

void main() {
  runApp(const MaterialApp(
      home: MediaQuery(
    data: MediaQueryData(),
    child: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Smart Home",
        home: Home(),
      ),
    );
  }
}
