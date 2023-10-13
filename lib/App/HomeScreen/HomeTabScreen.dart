import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/GetxControllers/AppGetxController.dart';
import 'package:reqres_app/GetxControllers/HomeTabGetx.dart';
import 'package:reqres_app/GetxControllers/TandingTabGetx.dart';
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

class _HomeTabScreenState extends State<HomeTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final AppGetxController appGetxController = Get.put(AppGetxController());
  final ScrollController _scrollController = ScrollController();

  final HomeTabController homeController = Get.put(HomeTabController());
  final TendingTabController tendingTabController =
      Get.put(TendingTabController());

  final List<Widget> _children = [
    const HomeTab(),
    const TrendingTab(),
    const CategoryTab(),
    // const SaveTabScreen(),
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
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(_handleTabSelection);
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        loadMoreImages();
      }
    });
  }

  _handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {
        tabController = tabController;
      });
      appGetxController.tabIndex(tabController.index);
    }
  }

  void loadMoreImages() {
    int activeIndex = appGetxController.tabIndex.value;
    if (activeIndex == 0) {
      homeController.getImage();
    }
    if (activeIndex == 1) {
      tendingTabController.getImage();
    }

    if (activeIndex == 2) {}
  }

  @override
  void dispose() {
    tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeTabScreenUI(
      scrollController: _scrollController,
      tabController: tabController,
      children: _children,
    );
  }
}
