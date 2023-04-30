import 'package:flutter/material.dart';
import 'package:reqres_app/main.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.MYWALL_QA;
  runApp(const MyWallApp());
}
