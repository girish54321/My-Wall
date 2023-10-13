import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/HomeTabScreen.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/auth/login/loginScreen.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/flavors.dart';
import 'package:dynamic_color/dynamic_color.dart';
// For rootBundle

class MyWallApp extends StatelessWidget {
  const MyWallApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    GetInstance().put<SettingController>(SettingController());
    String jwt = box.read(JWT_KEY) ?? "";
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            colorSchemeSeed: Color.fromARGB(255, 56, 20, 213),
            scaffoldBackgroundColor: Colors.black),
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Color.fromARGB(255, 56, 20, 213),
            brightness: Brightness.light),
        getPages: [
          GetPage(
            name: '/',
            page: () {
              return jwt.isNotEmpty
                  ? _wrapWithBanner(const HomeTabScreen())
                  : _wrapWithBanner(const LoginScreen());
            },
          ),
        ],
      );
    });
  }

  /// Adds banner to the [child] widget.
  Widget _wrapWithBanner(Widget child) {
    return Banner(
      child: child,
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.green.withOpacity(0.6),
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
      textDirection: TextDirection.ltr,
    );
  }
}
