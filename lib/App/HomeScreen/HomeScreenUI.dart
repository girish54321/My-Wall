import 'package:flutter/material.dart';
import 'package:reqres_app/AppConst/widgetList.dart';
import 'package:reqres_app/widget/appAboutDialog.dart';

class HomeScreenUI extends StatelessWidget {
  final List<Widget> children;
  const HomeScreenUI({Key? key, required this.children}) : super(key: key);

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
                  AppAboutDialog().showAppAboutDialog(context);
                }),
            centerTitle: true,
            elevation: 0.0,
            title: const Text("My Wall"),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {}),
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
