import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoryService {
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> result = await Api()
        // ignore: missing_required_param
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < result.length; i++) {
      productList.add(ProductModel.fromJson(result[i]));
    }
    return productList;
  }
}
