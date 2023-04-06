import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';

String imageToBase64(File image) {
  List<int> bytes = image.readAsBytesSync();
  return base64Encode(bytes);
}
void showProgressIndicator(BuildContext context){
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
  showDialog(context: context, builder: (context)=>alertDialog,barrierDismissible: false,);
}
String? token = CacheHelper.getData(key: CacheKeys.token);
String? userId = CacheHelper.getData(key: CacheKeys.userId);
String? userType = CacheHelper.getData(key: CacheKeys.userType);
bool? checkPublish = CacheHelper.getData(key: CacheKeys.checkPublish);
