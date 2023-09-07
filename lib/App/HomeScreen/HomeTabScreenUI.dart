import 'package:flutter/material.dart';
import 'package:reqres_app/App/SettingsScreen/SettingsScreen.dart';
import 'package:reqres_app/App/searchedImagePage.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/network/util/helper.dart';

class HomeTabScreenUI extends StatelessWidget {
  final List<Widget> children;
  const HomeTabScreenUI({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: mobileTabs,
            ),
            leading: IconButton(
                icon: const Icon(
                  Icons.info_outline,
                ),
                onPressed: () {
                  Helper().goToPage(context: context, child: SettingsScreen());
                }),
            centerTitle: true,
            elevation: 0.0,
            title: const Text("My Wall"),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Helper()
                        .goToPage(context: context, child: SearchedImagePage());
                  }),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              ...children,
            ],
          ),
        ));
  }
}
