import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/HomeTabGetx.dart';
import 'package:reqres_app/App/HomeScreen/HomeTab/HomeTabUI.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HomeTabController homeController = Get.put(HomeTabController());
  final ScrollController _scrollController = ScrollController();

  void loadMoreImages() {
    homeController.getImage();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        loadMoreImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeTabUI(
      homeTabController: homeController,
      scrollController: _scrollController,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
