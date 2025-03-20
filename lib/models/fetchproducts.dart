import 'dart:convert';
import 'package:http/http.dart' as http;

class Fetchproducts {
  static const String baseUrl = "https://fakestoreapi.com/products";

  // Fetch Products
  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
