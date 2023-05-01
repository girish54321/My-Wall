import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'package:reqres_app/state/settingsState.dart';
import 'package:reqres_app/widget/buttons.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

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
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          AppButton(
              child: Text(""),
              function: () {
                print(box.hasData(JWT_KEY));
              }),
          ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change app them"),
              trailing: Obx((() => Switch(
                    value: settingController.isDark.value,
                    onChanged: (bool _) => settingController.toggleThem(),
                  )))),
        ],
      ),
    );
  }
}
