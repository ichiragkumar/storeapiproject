import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:store/components/container_image.dart';
import '../models/store_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Store> allProducts = [];

  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 235, 235),
          appBar: AppBar(
            elevation: 0,
            title: Center(
                child: Text(
              "Products",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            backgroundColor: Color.fromARGB(255, 138, 25, 252),
          ),
          body: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: FutureBuilder(
                future: getProducts(),
                builder: (context, snapshot) {
                  return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            child: Container(
                              margin: EdgeInsets.all(3),
                              height: MediaQuery.of(context).size.height * 0.8,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 4),
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Image.network(
                                        "${allProducts[index].image}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      "${allProducts[index].title}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 8.0),
                                        child: Text(
                                          "\$${allProducts[index].price}",
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 28.0, right: 4.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.rate_review,
                                                size: 30,
                                                color: Colors.deepPurple,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  "${allProducts[index].rating.rate}",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.numbers,
                                                size: 30,
                                                color: Colors.greenAccent,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  "${allProducts[index].rating.count}",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                        "${allProducts[index].description}",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis)),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, right: 14.0),
                                    child: Text(
                                        "${allProducts[index].category}",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.save,
                                                    size: 40,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Text(
                                                  "SAVE",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.sell,
                                                    color: Colors.yellow,
                                                    size: 40,
                                                  ),
                                                ),
                                                Text(
                                                  "BUY",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      });
                }),
          )),
    );
  }
}
