import 'package:ecommerceapp/models/fetchproducts.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String sortOrder; // Receive sorting order

  const ProductScreen({super.key, required this.sortOrder});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<dynamic>> products;

  @override
  void initState() {
    super.initState();
    products = Fetchproducts.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading products"));
        } else {
          List<dynamic> sortedProducts = List.from(snapshot.data!);

          // Sorting logic
          if (widget.sortOrder == "low_to_high") {
            sortedProducts.sort((a, b) => (a['price'] as num).compareTo(b['price'] as num));
          } else if (widget.sortOrder == "high_to_low") {
            sortedProducts.sort((a, b) => (b['price'] as num).compareTo(a['price'] as num));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: sortedProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              var product = sortedProducts[index];
              return _buildProductCard(product);
            },
          );
        }
      },
    );
  }

  Widget _buildProductCard(dynamic product) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product['image'],
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${product['price']}",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: (product['status'] == "Trending Now")
                        ? Colors.redAccent
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
