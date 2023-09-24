import 'package:flutter/material.dart';
import 'package:reqres_app/App/SettingsScreen/SettingsScreen.dart';
import 'package:reqres_app/App/SearchSceen/searchedImagePage.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/network/util/helper.dart';

class HomeTabScreenUI extends StatelessWidget {
  final List<Widget> children;
  final TabController tabController;
  final ScrollController scrollController;
  const HomeTabScreenUI(
      {Key? key,
      required this.children,
      required this.tabController,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          controller: scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                      icon: const Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        Helper().goToPage(
                            context: context, child: SearchedImagePage());
                      }),
                ],
                leading: IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                    ),
                    onPressed: () {
                      Helper()
                          .goToPage(context: context, child: SettingsScreen());
                    }),
                pinned: true,
                snap: true,
                floating: true,
                title: const Text("My Wall"),
                centerTitle: true,
                bottom: TabBar(
                  controller: tabController,
                  tabs: <Widget>[
                    ...mobileTabs,
                  ],
                ),
              )
            ];
          }),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
