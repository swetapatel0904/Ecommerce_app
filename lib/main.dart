import 'package:ecommerce_app/screen/home/home_screen.dart';
import 'package:ecommerce_app/screen/product/product_screen.dart';
import 'package:ecommerce_app/screen/cart/cart_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>HomeScreen(),
        "product":(context)=>ProductScreen(),
        "cart":(context)=>CartScreen(),
      },
    )

  );
}

