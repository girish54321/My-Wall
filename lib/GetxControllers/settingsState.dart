import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/AppConst/AppConst.dart';

class SettingController extends GetxController {
  RxBool isDark = false.obs;
  GetStorage box = GetStorage();
  RxDouble perRow = 2.0.obs;

  @override
  void onReady() {
    super.onReady();
    loadThem();
    loadPerRow();
  }

  void loadPerRow() {
    if (box.hasData(PER_ROW)) {
      var val = box.read(PER_ROW);
      if (val != null) {
        perRow.value = val;
      } else {
        perRow.value = 2.0;
      }
    } else {
      perRow.value = 2.0;
    }
  }

  void onChangeSlider(double val) {
    perRow.value = val;
    box.write(PER_ROW, val);
    perRow.refresh();
  }

  void loadThem() {
    if (box.hasData(THEM_KEY)) {
      var isSavedDark = box.read(THEM_KEY);
      if (isSavedDark) {
        isDark.value = true;
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        isDark.value = false;
        Get.changeThemeMode(ThemeMode.light);
      }
    } else {
      isDark.value = false;
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  void saveThemSetting(bool value) {
    box.write(THEM_KEY, value);
  }

  void toggleThem() {
    isDark.value = !isDark.value;
    if (isDark.value == true) {
      saveThemSetting(true);
      Get.changeThemeMode(ThemeMode.dark);
    } else if (isDark.value == false) {
      saveThemSetting(false);
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
