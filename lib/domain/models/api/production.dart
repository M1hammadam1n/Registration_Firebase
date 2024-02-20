import 'dart:convert';

import 'package:fier/domain/models/production.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    List<dynamic> productJsonList = json.decode(response.body);
    return productJsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    // Если сервер вернул ответ, отличный от статуса 200 OK, бросаем исключение
    throw Exception('Failed to load products');
  }
}