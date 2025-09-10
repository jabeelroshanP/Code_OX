import 'dart:developer';
import 'package:code_ox/model/products_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  final Dio dio = Dio();
  final productUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductsModel>> getproduct() async {
    try {
      final response = await dio.get(productUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => ProductsModel.fromjson(e)).toList();
      } else {
        log("Null");
        return [];
      }
    } catch (e) {
      log("$e");
      throw Exception("Error fetching products");
    }
  }

  Future<ProductsModel?> addproducts(ProductsModel product) async {
    try {
      final response = await dio.post(
        productUrl,
        data: {
          "title": product.title,
          "price": product.price,
          "description": product.description,
          "category": product.category,
        },
      );
      log(response.data.toString());

      if (response.statusCode == 200) {
        return ProductsModel.fromjson(response.data);
      }
      return null;
    } catch (e) {
      log("Error while adding: $e");
      return null;
    }
  }
}
