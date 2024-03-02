import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/main.dart';
import 'flavors.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Platform.isMacOS) {
    await FlutterDownloader.initialize(ignoreSsl: true);
  }
  await GetStorage.init();
  F.appFlavor = Flavor.MYWALL_DEV;
  runApp(const MyWallApp());
}
