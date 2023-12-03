import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/SelectedImageGetx.dart';
import 'package:reqres_app/network/util/helper.dart';

class DownloadButton extends StatefulWidget {
  final String url;
  const DownloadButton({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  final SelectedImageController selectedImageController =
      Get.put(SelectedImageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => FloatingActionButton(
            child: const Icon(Icons.download),
            tooltip: selectedImageController.title.value,
            onPressed: (() => Helper().settingModalBottomSheet(
                context, selectedImageController.downloadOptionList)),
          )),
    );
  }
}
