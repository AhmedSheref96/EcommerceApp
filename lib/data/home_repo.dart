import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class HomeRepo {

  Future<List<ProductModel>> getProducts() async {
    var response = await http.get(Uri.https("fakestoreapi.com", "products"));
    var data = json.decode(response.body);
    return (data as List).map((element) {
      return ProductModel.fromJson(element);
    }).toList();
  }

}
