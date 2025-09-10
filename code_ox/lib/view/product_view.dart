
import 'package:code_ox/controller/provider.dart';
import 'package:code_ox/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  final ProductsModel product;
  const ProductView({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: Image.network(product.image ?? "No Image",height: 250, )),
            Text("Title: ${product.title}"),
            Text("Price: ${product.price}"),
            Text("Description :${product.description}"),
            Text("Category: ${product.category}"),

        ],);
        },
      ),
    );
  }
}
