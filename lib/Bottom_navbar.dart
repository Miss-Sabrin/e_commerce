import 'package:e_commerce/pages/cart_detail.dart';
import 'package:e_commerce/pages/favirate.dart';
import 'package:e_commerce/pages/home_screen.dart';
import 'package:e_commerce/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex=0;
    List screens=[
      HomeScreen(),
      FavoriteScreen(),
      ProfileScreen(),

    ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text(' E-Commerce Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>CartDetail())
              );
            },
           icon: Icon(Icons.add_shopping_cart))
        ],
      ),
      body: screens[currentIndex],

      
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() =>currentIndex=value);
            
   
        },
        items: const [
          BottomNavigationBarItem(
            
            label: 'Home',
            icon: Icon(Icons.home),
            
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite),
              
              ),
              BottomNavigationBarItem(
                label: 'person',
                icon: Icon(Icons.person))

      ]),
      
    );

  }
}