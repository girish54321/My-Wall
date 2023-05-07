import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/HomeTabGetx.dart';
import 'package:reqres_app/App/HomeScreen/HomeTab/HomeTabUI.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final HomeTabController homeController = Get.put(HomeTabController());

    return HomeTabUI(
      homeTabController: homeController,
    );
  }
}
