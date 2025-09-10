import 'package:code_ox/model/products_model.dart';
import 'package:code_ox/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService service = ProductService();
  List<ProductsModel> products = [];

  Future<void> getProducts() async {
    products = await service.getproduct();
    notifyListeners();
  }

  Future<void> addProducts(ProductsModel product) async {
    final newProduct = await service.addproducts(product);
    if (newProduct != null) {
      products.add(newProduct);
      notifyListeners();
    }
  }
}
