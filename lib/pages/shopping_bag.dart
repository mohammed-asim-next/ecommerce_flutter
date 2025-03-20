 import 'package:flutter/material.dart';

class ShoppingBagScreen extends StatefulWidget{
  const ShoppingBagScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ShoppingBagScreenState();

 }

 class _ShoppingBagScreenState extends State<ShoppingBagScreen>{
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
    body: Center(
      child: Text("ShoppingBagScreen",),
    ),
   );
  }

 }