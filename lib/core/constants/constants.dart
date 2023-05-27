import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';

import '../../translations/locale_keys.g.dart';

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
List<String> freelancerItemsList = [
  LocaleKeys.in_home.tr(),
];

List<String> vendorItemsList = [
  LocaleKeys.in_center.tr(),
  LocaleKeys.in_home.tr(),
];

List<String> todayTo = [
  LocaleKeys.today.tr(),
  LocaleKeys.yesterday.tr(),
];
String? token = CacheHelper.getData(key: CacheKeys.token);
String initialLocale = CacheHelper.getData(key: CacheKeys.initialLocale)??"ar";
String? userId = CacheHelper.getData(key: CacheKeys.userId);
String? userType = CacheHelper.getData(key: CacheKeys.userType);
bool? checkPublish = CacheHelper.getData(key: CacheKeys.checkPublish);
