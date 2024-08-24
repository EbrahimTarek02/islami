import 'package:flutter/material.dart';
import 'package:islami/data/api_manager.dart';
import 'package:islami/data/model/radio_response.dart';

class RadioProvider extends ChangeNotifier {
  ApiManager apiManager = ApiManager();
  bool isPlaying = false;

  Future<RadioResponse> getRadio() async {
    return await apiManager.getRadio();
  }
}