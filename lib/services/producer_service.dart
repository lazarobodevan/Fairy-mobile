import 'package:http/http.dart';
import 'package:mobile/environment.dart';
import 'package:mobile/models/producer_model.dart';
import 'package:mobile/models/producer_request_model.dart';

class ProducerService{

  getProducers(double latitude, double longitude, int radiusInKm) async{
    Response response = await get(Uri.parse("${Environment.apiUrl}/Producer?latitude=$latitude&longitude=$longitude&radiusInKm=$radiusInKm"));
    if(response.statusCode == 200){
      final ProducerRequestModel result = producerRequestModelFromJson(response.body);
      return result;
    }
  }

}