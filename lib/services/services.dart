import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:meragi/models/produuct_model.dart';

class HttpService {
  static Future<List<Product>> getProduct() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    List<Product> products = [];

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;

      jsonResponse.forEach((element) {
        products.add(Product.fromJson(element));
      });
      print(products);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return products;
  }
}
