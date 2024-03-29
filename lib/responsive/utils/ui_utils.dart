import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:reqres_app/responsive/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 500) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
