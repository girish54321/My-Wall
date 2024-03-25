import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';

class ImageRowSettingView extends StatefulWidget {
  const ImageRowSettingView({Key? key}) : super(key: key);

  @override
  State<ImageRowSettingView> createState() => _ImageRowSettingViewState();
}

class _ImageRowSettingViewState extends State<ImageRowSettingView> {
  final SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Per Row ${settingController.perRow.value.round()}"),
            ),
            Slider(
              min: 2.0,
              max: 10.0,
              value: settingController.perRow.value,
              label: "${settingController.perRow.value.round()}",
              divisions: 5,
              onChanged: (value) {
                settingController.onChangeSlider(value);
                // settingController.loadPerRow();
              },
            ),
          ],
        ));
  }
}
