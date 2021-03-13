import 'package:flutter/material.dart';
import 'package:simple_bloc/screens/cart_item_list_screen.dart';
import 'package:simple_bloc/screens/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (BuildContext context) => ProductListScreen(),
        "cart": (BuildContext context) => CartItemListScreen(),
      },
      initialRoute: "/",
      title: 'Bloc Demo',
    );
  }
}
