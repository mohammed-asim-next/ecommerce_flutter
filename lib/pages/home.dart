import 'package:ecommerceapp/pages/shopping_bag.dart';
import 'package:ecommerceapp/pages/home_screen.dart';
import 'package:ecommerceapp/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState()=>
   _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const ShoppingBagScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text("E- Commerce Shop"),
      centerTitle: true,
    ),
    body: screens[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value){
        setState(() {
          currentIndex = value;
        });
      },
      selectedItemColor: const Color.fromARGB(255, 6, 22, 251),
      unselectedItemColor: Colors.grey,
      items: const[BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
        
      ),
      BottomNavigationBarItem(
        label: "Favorite",
        icon: Icon(Icons.shopping_cart_sharp),
        
      ),
      BottomNavigationBarItem(
        label: "Profile",
        icon: Icon(Icons.person),
        
      ),
      ],
    ),
   );
  }


}