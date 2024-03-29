import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/ImageRowSettingView.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingController settingController =
      GetInstance().put<SettingController>(SettingController());
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change app them"),
              trailing: Obx((() => Switch(
                    value: settingController.isDark.value,
                    onChanged: (bool _) => settingController.toggleThem(),
                  )))),
          const ImageRowSettingView(),
          ListTile(
            title: const Text("LogOut"),
            onTap: () {
              Helper().userLogout(context);
            },
          )
        ],
      ),
    );
  }
}
