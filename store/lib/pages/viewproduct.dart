import 'package:flutter/material.dart';
import '../models/store_model.dart';
import 'home_page.dart';

class ViewProductLarge extends StatelessWidget {
  const ViewProductLarge({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Image.network(
        "${allProducts[index].image}",
        fit: BoxFit.fill,
      ),
    );
  }
}
