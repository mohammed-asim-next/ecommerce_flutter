import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/my_product.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0; // 0 = All Products, 1 = Low to High, 2 = High to Low
  String sortOrder = "default"; // Sorting state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Our Products",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All Products", order: "default"),
              _buildProductCategory(index: 1, name: "Low To High", order: "low_to_high"),
              _buildProductCategory(index: 2, name: "High To Low", order: "high_to_low"),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ProductScreen(sortOrder: sortOrder), // Pass sorting order
          ),
        ],
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String name, required String order}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
          sortOrder = order; // Update sorting order
        });
      },
      child: Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (isSelected == index) ? Colors.deepPurple : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
