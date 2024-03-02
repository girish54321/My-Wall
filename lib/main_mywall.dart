import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/main.dart';
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.MYWALL;
  if (!Platform.isMacOS) {
    await FlutterDownloader.initialize(ignoreSsl: true);
  }
  await GetStorage.init();
  runApp(const MyWallApp());
}
