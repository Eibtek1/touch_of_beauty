import 'dart:convert';
import 'dart:io';

String imageToBase64(File image) {
  List<int> bytes = image.readAsBytesSync();
  return base64Encode(bytes);
}

List<Map<String, dynamic>> citiesList = [];

