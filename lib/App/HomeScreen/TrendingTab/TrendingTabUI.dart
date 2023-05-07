import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/TandingTabGetx.dart';
import 'package:reqres_app/widget/imageList.dart';

class TrendingTabUI extends StatelessWidget {
  final TendingTabController tendingTabController;
  const TrendingTabUI({Key? key, required this.tendingTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => tendingTabController.homeScreenLoading.value
          ? const Center(child: CircularProgressIndicator())
          : tendingTabController.tendingImages.value.isEmpty
              ? const Text("Noting Here")
              : ImageList(
                  imageList: tendingTabController.tendingImages.value,
                )),
    );
  }
}
