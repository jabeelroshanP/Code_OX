import 'package:code_ox/controller/provider.dart';
import 'package:code_ox/view/addScreen.dart';
import 'package:code_ox/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addscreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          if (value.products.isEmpty) {
            value.getProducts();
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: value.products.length,
            itemBuilder: (context, index) {
              final product = value.products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductView(product: product),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Image.network(product.image ?? "No Image"),
                    title: Text(product.title),
                    subtitle: Text(product.price.toStringAsFixed(2)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
