import 'package:http/http.dart';
import 'package:mobile/environment.dart';

class ProductService{

  getProductById(String id)async{
    Response response = await get(Uri.parse("${Environment.apiUrl}/Product/productId=$id"));
    if(response.statusCode == 200){
      print(response.body);
    }
  }
}