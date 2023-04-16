import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/store_model.dart';

import 'package:http/http.dart' as http;

Widget ShowFullImage() {
  List<Store> allProducts = [];

  Future<List<Store>> getProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        allProducts.add(Store.fromJson(index));
      }

      return allProducts;
    } else {
      return allProducts;
    }
  }

  return FutureBuilder(
      future: getProducts(),
      builder: ((context, snapshot) {
        return SafeArea(
          child: Container(
            height: 100,
            width: 120,
            child: Image.network(
              "${allProducts.elementAt(5).image}",
              fit: BoxFit.fill,
            ),
          ),
        );
      }));
}
