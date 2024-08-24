import 'dart:convert';
import 'package:http/http.dart';
import 'package:islami/data/model/radio_response.dart';
import 'package:islami/ui/utils/app_constants.dart';

class ApiManager {

  Future<RadioResponse> getRadio() async{
    String baseUrl = "mp3quran.net";
    String endPoint = "api/v3/radios";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await get(uri);

      RadioResponse radioResponse = RadioResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300){
        return radioResponse;
      }
      else {
        throw Exception(AppConstants.defaultErrorMessage);
      }
    } catch (_) {
      rethrow;
    }
  }
}