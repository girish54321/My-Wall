import 'package:get/get.dart';

class AppGetxController extends GetxController {
  RxInt tabIndex = RxInt(0);

  @override
  void onReady() {
    super.onReady();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
