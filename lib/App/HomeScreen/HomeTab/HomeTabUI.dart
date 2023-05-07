import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/HomeTabGetx.dart';
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
      (() => homeTabController.homeScreenImage.value.isEmpty &&
              homeTabController.homeScreenLoading.value
          ? const Center(child: CircularProgressIndicator())
          : homeTabController.homeScreenImage.value.isEmpty
              ? const Text("Noting Here")
              : ImageList(
                  imageList: homeTabController.homeScreenImage.value,
                  scrollController: scrollController,
                )),
    );
  }
}
