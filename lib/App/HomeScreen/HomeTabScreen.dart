import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/App/HomeScreen/CategoryTab/CategoryTab.dart';
import 'package:reqres_app/App/HomeScreen/HomeTab/HomeTab.dart';
import 'package:reqres_app/App/HomeScreen/HomeTabScreenUI.dart';
import 'package:reqres_app/App/HomeScreen/TrendingTab/TrendingTab.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class AppMenuItem {
  final String id;
  final Widget widget;
  AppMenuItem(this.id, this.widget);
}

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  PageController? pageController;
  int selectedIndex = 0;
  final List<Widget> _children = [
    const CategoryTab(),
    const TrendingTab(),
    const HomeTab(),
  ];

  Future<void> userLogout() async {
    final action =
        await Dialogs.yesAbortDialog(context, 'Log Out?', 'Are you sure?');
    if (action == DialogAction.yes) {
      final box = GetStorage();
      box.remove('token');
      // Get.offAll(LoginScreen());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeTabScreenUI(
      children: _children,
    );
  }
}
