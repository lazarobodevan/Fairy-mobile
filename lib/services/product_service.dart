import 'package:http/http.dart';
import 'package:mobile/environment.dart';
import 'package:mobile/models/product/product_model.dart';
import 'package:mobile/models/product/product_request_model.dart';

class ProductService {

  getProductById(String id) async {
    try {
      Response response = await get(
          Uri.parse("${Environment.apiUrl}/Product/id=$id"));
      if (response.statusCode == 200) {
        var productDetails = productModelFromJson(response.body);
        return productDetails;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  getNearbyProducts(double latitude, double longitude, int radiusInKm) async {
    try {
      Response response = await get(Uri.parse("${Environment
          .apiUrl}/Product?latitude=$latitude&longitude=$longitude&radiusInKm=$radiusInKm"));
      if (response.statusCode == 200) {
        var products = productRequestModelFromJson(response.body);
        return products;
      }

      throw Exception("Erro. StatusCode: ${response.statusCode} ; Message: ${response.body}");

    } catch (e) {
      print(e);
      rethrow;
    }
  }
}