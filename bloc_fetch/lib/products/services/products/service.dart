import 'package:dio/dio.dart';
import 'model.dart';
export 'model.dart';

class ProductsService {
  Future<ProductsModel> getProducts() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://dummyjson.com/products');

      ProductsModel resData = ProductsModel.fromJson(response.data);

      return resData;
    } catch (e) {
      return Future.error(e);
    }
  }
}
