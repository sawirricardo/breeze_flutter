import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await dotenv.load();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Breeze Flutter",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
