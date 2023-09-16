import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/TandingTabGetx.dart';
import 'package:reqres_app/App/HomeScreen/TrendingTab/TrendingTabUI.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab> {
  ScrollController scrollController = ScrollController();
  final TendingTabController tendingTabController =
      Get.put(TendingTabController());

  void loadMoreImages() {
    tendingTabController.getImage();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        loadMoreImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TrendingTabUI(
      tendingTabController: tendingTabController,
      scrollController: scrollController,
    );
  }
}
