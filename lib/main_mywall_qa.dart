import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/main.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.MYWALL_QA;
  await GetStorage.init();
  runApp(const MyWallApp());
}
