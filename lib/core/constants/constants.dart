import 'dart:convert';
import 'dart:io';

String imageToBase64(String path) {
  List<int> bytes = File(path).readAsBytesSync();
  return base64Encode(bytes);
}

List<Map<String, dynamic>> citiesList = [];

String chosenCity ='';