import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/HomeTabGetx.dart';
import 'package:reqres_app/widget/imageList.dart';

class HomeTabUI extends StatelessWidget {
  final HomeTabController homeTabController;
  final ScrollController scrollController;

  const HomeTabUI(
      {Key? key,
      required this.homeTabController,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ImageList(
            isLoading: homeTabController.homeScreenLoading.value,
            imageList: homeTabController.homeScreenImage,
            scrollController: scrollController,
          )),
    );
  }
}
