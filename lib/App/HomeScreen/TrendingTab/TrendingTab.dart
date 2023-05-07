import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/TandingTabGetx.dart';
import 'package:reqres_app/App/HomeScreen/TrendingTab/TrendingTabUI.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab> {
  @override
  Widget build(BuildContext context) {
    final TendingTabController tendingTabController =
        Get.put(TendingTabController());
    return TrendingTabUI(
      tendingTabController: tendingTabController,
    );
  }
}
