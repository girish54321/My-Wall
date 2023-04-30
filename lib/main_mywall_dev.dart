import 'package:flutter/material.dart';
import 'package:reqres_app/main.dart';
import 'flavors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.MYWALL_DEV;
  runApp(const MyWallApp());
}
