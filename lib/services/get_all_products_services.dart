import 'dart:developer';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      try {
        ProductModel product = ProductModel.fromJson(data[i]);
        productList.add(product);
      } catch (e) {
        // Log any errors during parsing
        log('Error parsing item $i: $e');
      }
    }

    return productList;
  }
}
