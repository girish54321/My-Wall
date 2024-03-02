import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/SettingsScreen/SettingsScreen.dart';
import 'package:reqres_app/App/SearchSceen/searchedImagePage.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/GetxControllers/GratingsTabController.dart';
import 'package:reqres_app/network/util/helper.dart';

class HomeTabScreenUI extends StatefulWidget {
  final List<Widget> children;
  final TabController tabController;
  final ScrollController scrollController;
  final Widget? body;
  const HomeTabScreenUI(
      {Key? key,
      required this.children,
      required this.tabController,
      required this.scrollController,
      this.body})
      : super(key: key);

  @override
  State<HomeTabScreenUI> createState() => _HomeTabScreenUIState();
}

class _HomeTabScreenUIState extends State<HomeTabScreenUI> {
  final GratingsTabController gratingsTabController =
      Get.put(GratingsTabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                Helper().goToPage(
                    context: context, child: const SearchedImagePage());
              }),
        ],
        leading: IconButton(
            icon: const Icon(
              Icons.info_outline,
            ),
            onPressed: () {
              Helper()
                  .goToPage(context: context, child: const SettingsScreen());
            }),
        title: const Text("My Wall"),
        centerTitle: true,
        bottom: widget.body != null
            ? null
            : TabBar(
                controller: widget.tabController,
                tabs: mobileTabs,
              ),
      ),
      body: widget.body ??
          TabBarView(
            controller: widget.tabController,
            children: widget.children,
          ),
    );
  }
}
