import 'package:http/http.dart';
import 'package:mobile/environment.dart';
import 'package:mobile/models/producer/producer_products_request_model.dart';
import 'package:mobile/models/producer/producer_request_model.dart';


class ProducerService{

  getProducers(double latitude, double longitude, int radiusInKm) async{
    try {
      Response response = await get(Uri.parse("${Environment
          .apiUrl}/Producer?latitude=$latitude&longitude=$longitude&radiusInKm=$radiusInKm"));
      if (response.statusCode == 200) {
        final ProducerRequestModel result = producerRequestModelFromJson(
            response.body);
        return result;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }
  
  getProducerDetails(String producerId) async{
    try{
      Response response = await get(Uri.parse("${Environment.apiUrl}/Product/producerId=$producerId?isOrganic=false"));
      if(response.statusCode == 200){
        var producerDetails = producerProductsRequestFromJson(response.body);

        return producerDetails;
      }
      throw Exception("Erro ao buscar no servidor: ${response.body}");
    }catch(e){
      print(e);
      rethrow;
    }
  }

}