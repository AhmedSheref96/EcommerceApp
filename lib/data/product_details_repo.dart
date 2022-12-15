import 'dart:convert';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsRepo {

  getProductDetails(int id) async {
    var httpResponse =
        await http.get(Uri.http("fakestoreapi.com","products/$id"));

    print("************** httpResponse $httpResponse");
    var response = json.decode(httpResponse.body);
    print("************** response $response");
    ProductModel product = ProductModel.fromJson(response);
    print("************** product $product");
    return product;
  }

}
