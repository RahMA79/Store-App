import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategories {
  final Dio dio = Dio();

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> result =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return result;
  }
}
