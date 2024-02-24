import 'package:e_commerce/Bottom_navbar.dart';
import 'package:e_commerce/pages/home_screen.dart';
import 'package:e_commerce/provider/cart_provider.dart';
import 'package:e_commerce/provider/favrite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_)=>  CartProvider()),
    ],
    
    child: MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        scaffoldBackgroundColor: Colors.grey.shade100
      ),
      
      debugShowCheckedModeBanner: false,
      
      
      home: BottomNavbar(),
    ),
  );
  } 
