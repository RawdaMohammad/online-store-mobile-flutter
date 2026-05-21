import 'package:dio/dio.dart';
import 'package:online_store/features/products/models/product_model.dart';

class ProductService {
	String endPoint = "https://dummyjson.com/products";
	final dio = Dio();

	Future<List<ProductModel>> getProducts() async {
		List<ProductModel> products = [];
		try {
			var response = await dio.get(endPoint);
			var data = response.data;

			data.forEach((json) {
				ProductModel product = ProductModel.fromJson(json);
				products.add(product);
			});
		} catch (e) {
			throw Exception(e.toString());
		}
		return products;
	}
}
