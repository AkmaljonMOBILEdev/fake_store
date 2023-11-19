import 'dart:convert';
import 'package:fake_store/data/models/user/user_in_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:fake_store/data/models/data.dart';

import '../../utils/constants.dart';
import '../models/product/product_model.dart';

class ApiService {
  Future<UniversalData> loginUser({
    required String username,
    required String password,
  }) async {
    Uri url = Uri.parse('$baseUrl/auth/login');
    try {
      final response = await http.post(
        url,
        body: {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        String token = jsonDecode(response.body)["token"];
        debugPrint("1T: $token");
        return UniversalData(data: token);
      }
      return UniversalData(error: "Connection error occurred!");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getAllProducts() async {
    Uri url = Uri.parse('$baseUrl/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalData(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => ProductModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: 'Connection error occurred!');
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getAllCategories() async {
    Uri uri = Uri.parse("$baseUrl/products/categories");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => e as String)
                .toList());
      }
      return UniversalData(error: "Connection error!");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getProductsByCategory(String category) async {
    Uri uri = Uri.parse("$baseUrl/products/category/$category");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList());
      }
      return UniversalData(error: "Connection error!");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getProductById(int id) async {
    Uri uri = Uri.parse("$baseUrl/products/$id");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalData(error: "Connection error!");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getUserInfo(int id) async {
    Uri uri = Uri.parse("$baseUrl/carts/user/$id");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => UserInCartModel.fromJson(e))
                .toList());
      }
      return UniversalData(error: "Connection error!");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}
